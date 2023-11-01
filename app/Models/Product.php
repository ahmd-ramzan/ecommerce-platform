<?php

namespace App\Models;

use Cknow\Money\Money;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\Image\Manipulations;

class Product extends Model implements HasMedia
{
    use InteractsWithMedia;

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
     * @return HasMany
     */
    public function variations(): HasMany
    {
        return $this->hasMany(Variation::class);
    }
}
