<?php

namespace App\Models;

use Cknow\Money\Money;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingType extends Model
{
    use HasFactory;

    /**
     * @return Money
     */
    public function formattedPrice()
    {
        return money($this->price);
    }
}
