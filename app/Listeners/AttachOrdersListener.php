<?php

namespace App\Listeners;

use App\Models\Order;

class AttachOrdersListener
{
    public function __construct()
    {
    }

    public function handle($event): void
    {
        Order::query()->where('email', $event->user->email)->get()->each(function ($order) use ($event) {
            $order->user()->associate($event->user);
            $order->save();
    });
    }
}
