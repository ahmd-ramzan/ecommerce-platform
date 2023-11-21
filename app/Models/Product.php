<?php

namespace App\Models;

use App\Models\Scopes\LiveScope;
use Cknow\Money\Money;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Scout\Searchable;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\Image\Manipulations;

class Product extends Model implements HasMedia
{
    use InteractsWithMedia, Searchable;

    public static function booted()
    {
        static::addGlobalScope(new LiveScope());
    }

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

    /**
     * @return BelongsToMany
     */
    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class);
    }

    /**
     * Get the indexable data array for the model.
     *
     * @return array<string, mixed>
     */
    public function toSearchableArray(): array
    {
        return array_merge([
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'price' => $this->price,
            'category_ids' => $this->categories->pluck('id')->toArray()
        ], $this->variations->groupBy('type')
            ->mapWithKeys(fn ($variation, $key) => [
                $key => $variation->pluck('title')
            ])
            ->toArray()
        );
    }
}
