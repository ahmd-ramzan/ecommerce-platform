<?php

namespace App\Models;

use Cknow\Money\Money;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\MediaLibrary\HasMedia;
use Spatie\Image\Manipulations;
use Staudenmeir\LaravelAdjacencyList\Eloquent\HasRecursiveRelationships;

class Variation extends Model implements HasMedia
{
    use HasFactory, HasRecursiveRelationships, InteractsWithMedia;

    public function registerMediaConversions(?Media $media = null): void
    {
        $this
            ->addMediaConversion('thumb200x200')
            ->fit(Manipulations::FIT_CROP, 200, 200)
            ->nonQueued();
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('default')
            ->useFallbackUrl(url('/storage/no-image.png'));
    }

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
