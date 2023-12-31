<?php

namespace App\Cart;

use App\Cart\Contracts\CartInterface;
use App\Exceptions\QuantityNoLongerAvailableException;
use App\Models\Cart as ModelsCart;
use App\Models\User;
use App\Models\Variation;
use Exception;
use Illuminate\Session\SessionManager;

class Cart implements CartInterface
{
    protected $instance;

    public function __construct(protected SessionManager $session) {}

    public function exists()
    {
        return $this->session->has(config('cart.session.key')) && $this->instance();
    }

    public function destroy()
    {
        $this->session->forget(config('cart.session.key'));
        $this->instance()->delete();
    }

    public function associate(User $user)
    {
        $this->instance()->user()->associate($user);

        $this->instance()->save();
    }

    public function create(?User $user = null)
    {
        $instance = ModelsCart::make();

        if ($user) {
            $instance->user()->associate($user);
        }

        $instance->save();

        $this->session->put(config('cart.session.key'), $instance->uuid);
    }

    public function add(Variation $variation, $quantity = 1)
    {
        if ($existingVariation = $this->getVariation($variation)) {
            $quantity += $existingVariation->pivot->quantity;
        }

        $this->instance()->variations()->syncWithoutDetaching([
            $variation->id => [
                'quantity' => min($quantity, $variation->stockCount())
            ]
        ]);
    }

    public function changeQuantity(Variation $variation, $quantity)
    {
        $this->instance()->variations()->updateExistingPivot($variation->id, [
            'quantity' => min($quantity, $variation->stockCount())
        ]);
    }

    public function remove(Variation $variation)
    {
        $this->instance()->variations()->detach($variation);
    }

    public function getVariation(Variation $variation)
    {
        return $this->instance()->variations->find($variation->id);
    }

    public function contents()
    {
        return $this->instance()->variations;
    }

    public function verifyAvailableQuantities()
    {
        $this->instance()->variations->each(function ($variation) {
            if ($variation->pivot->quantity > $variation->stocks->sum('amount')) {
                throw new QuantityNoLongerAvailableException('Stock Reduced');
            }
        });
    }

    public function syncAvailableQuantities()
    {
        $syncedQuantities = $this->instance()->variations->mapWithKeys(function ($variation) {
           $quantity = $variation->pivot->quantity > $variation->stocks->sum('amount')
               ? $variation->stockCount()
               : $variation->pivot->quantity;

           return [
               $variation->id => [
                   'quantity' => $quantity
               ]
           ];
        })->reject(function ($syncedQuantities) {
           return $syncedQuantities['quantity'] === 0;
        })->toArray();

        $this->instance()->variations()->sync($syncedQuantities);

        $this->clearInstanceCache();
    }

    public function contentsCount()
    {
        return $this->contents()->count();
    }

    public function subtotal()
    {
        return $this->instance()->variations
            ->reduce(function ($carry, $variation) {
                return $carry + ($variation->price * $variation->pivot->quantity);
            });
    }

    public function hasPaymentIntent()
    {
        return !is_null($this->getPaymentIntentId());
    }

    public function getPaymentIntentId()
    {
        return $this->instance()->payment_intent_id;
    }

    public function updatePaymentIntentId($paymentIntentId)
    {
        $this->instance()->update([
            'payment_intent_id' => $paymentIntentId
        ]);
    }

    public function formattedSubtotal()
    {
        return money($this->subtotal());
    }

    public function isEmpty()
    {
        return $this->contents()->count() === 0;
    }

    public function clearInstanceCache()
    {
        $this->instance = null;
    }

    public function removeAll()
    {
        $this->instance()->variations()->detach();
    }

    public function instance()
    {
        if ($this->instance) {
            return $this->instance;
        }

        return $this->instance =  ModelsCart::query()
            ->with('variations.product', 'variations.ancestorsAndSelf', 'variations.media', 'variations.descendantsAndSelf.stocks')
            ->whereUuid($this->session->get(config('cart.session.key')))
            ->first();
        /* to start 27*/
    }
}
