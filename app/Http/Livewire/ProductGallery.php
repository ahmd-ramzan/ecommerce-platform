<?php

namespace App\Http\Livewire;

use App\Models\Product;
use Livewire\Component;

class ProductGallery extends Component
{
    public Product $product;

    public $selectedMediaUrl;

    public function mount()
    {
        $this->selectedMediaUrl = $this->product->getFirstMediaUrl();
    }

    public function selectImage($url)
    {
        $this->selectedMediaUrl = $url;
    }

    public function render()
    {
        return view('livewire.product-gallery');
    }
}
