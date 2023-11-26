<?php

namespace App\Models;

use App\Models\Presenters\OrderPresenter;
use Cknow\Money\Money;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Str;

class Order extends Model
{
    use HasFactory;

    protected $guarded = [];

    public $timestamps = [
        'placed_at',
        'packaged_at',
        'shipped_at'
    ];

    protected $casts = [
        'placed_at' => 'datetime',
        'packaged_at' => 'datetime',
        'shipped_at' => 'datetime'
    ];

    public $statuses = [
        'placed_at',
        'packaged_at',
        'shipped_at'
    ];

    protected static function booted()
    {
        static::creating(function (Order $order) {
            $order->placed_at = now();
            $order->packaged_at = null;
            $order->shipped_at = null;

            $order->uuid = (string) Str::uuid();
        });
    }

    /**
     * @return Money
     */
    public function formattedSubtotal()
    {
        return money($this->subtotal);
    }

    public function status()
    {
        return collect($this->statuses)
            ->last(fn ($status) => filled($this->{$status}));
    }

    public function presenter()
    {
        return new OrderPresenter($this);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function shippingType()
    {
        return $this->belongsTo(ShippingType::class);
    }

    public function shippingAddress()
    {
        return $this->belongsTo(ShippingAddress::class);
    }

    public function variations()
    {
        return $this->belongsToMany(Variation::class)
            ->withPivot(['quantity'])
            ->withTimestamps();
    }
}
