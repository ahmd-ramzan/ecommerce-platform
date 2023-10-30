<?php

namespace App\Http\Livewire;

use App\Models\Variation;
use Livewire\Component;

class ProductDropdown extends Component
{
    public $variations;

    public $selectedVariation;

    public function getSelectedVariationModelProperty()
    {
        if (! $this->selectedVariation) return;

        return Variation::find($this->selectedVariation);
    }

    public function updatedSelectedVariation()
    {

    }

    public function render()
    {
        return view('livewire.product-dropdown');
    }
}
