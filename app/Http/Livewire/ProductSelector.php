<?php

namespace App\Http\Livewire;

use App\Cart\Contracts\CartInterface;
use App\Models\Product;
use App\Models\Variation;
use Livewire\Component;

class ProductSelector extends Component
{
    protected $listeners = ['skuVariantSelected'];

    public Product $product;

    public $initialVariation;

    public $skuVariant;

    public function mount()
    {
        $this->initialVariation = $this->product->variations->sortBy('order')->groupBy('type')->first();
    }

    public function skuVariantSelected($variantId)
    {
        if (! $variantId) {
            $this->skuVariant = null;
            return;
        }

        $this->skuVariant = Variation::find($variantId);
    }

    public function addToCart(CartInterface $cart)
    {
        $cart->add($this->skuVariant, 1);

        $this->emit('cart.updated');

        $this->dispatchBrowserEvent('notification', [
            'body' => $this->skuVariant->product->title.' Added to cart',
            'timeout' => 4000
        ]);
    }

    public function render()
    {
        return view('livewire.product-selector');
    }
}
