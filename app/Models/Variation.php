<?php

namespace App\Models;

use Cknow\Money\Money;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Staudenmeir\LaravelAdjacencyList\Eloquent\HasRecursiveRelationships;

class Variation extends Model
{
    use HasFactory, HasRecursiveRelationships;

    /**
     * @return Money
     */
    public function formattedPrice()
    {
        return money($this->price);
    }

    /**
     * @return bool
     */
    public function inStock()
    {
        return $this->stockCount() > 0;
    }

    /**
     * @return bool
     */
    public function outOfStock()
    {
        return !$this->inStock();
    }

    /**
     * @return mixed
     */
    public function stockCount()
    {
        return $this->descendantsAndSelf->sum(fn ($variation) => $variation->stocks->sum('amount'));
    }

    public function lowStock()
    {
        return !$this->outOfStock() && $this->stockCount() <= 5;
    }

    /**
     * @return BelongsTo
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * @return HasMany
     */
    public function stocks()
    {
        return $this->hasMany(Stock::class);
    }
}
