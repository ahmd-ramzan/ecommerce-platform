<?php

namespace App\Http\Livewire;

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

    public function addToCart()
    {
        
    }

    public function render()
    {
        return view('livewire.product-selector');
    }
}
