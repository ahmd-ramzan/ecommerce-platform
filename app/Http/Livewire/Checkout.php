<?php

namespace App\Http\Livewire;

use App\Cart\Contracts\CartInterface;
use App\Models\ShippingType;
use Livewire\Component;

class Checkout extends Component
{
    public $shippingTypeId;

    public $shippingTypes;

    public function mount()
    {
        $this->shippingTypes = ShippingType::orderBy('price', 'asc')->get();

        $this->shippingTypeId = $this->shippingTypes->first()->id;
    }

    /**
     * computed property
     * @return mixed
     */
    public function getShippingTypeProperty()
    {
        return $this->shippingTypes->find($this->shippingTypeId);
    }

    /**
     * computed property
     * @param CartInterface $cart
     * @return mixed
     */
    public function getTotalProperty(CartInterface $cart)
    {
        return money($cart->subtotal() + $this->shippingType->price);
    }

    public function render(CartInterface $cart)
    {
        return view('livewire.checkout', [
            'cart' => $cart
        ]);
    }
}
