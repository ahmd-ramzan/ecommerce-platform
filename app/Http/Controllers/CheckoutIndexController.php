<?php

namespace App\Http\Controllers;

use App\Cart\Contracts\CartInterface;
use App\Exceptions\QuantityNoLongerAvailableException;
use App\Http\Middleware\RedirectIfCartEmpty;

class CheckoutIndexController extends Controller
{
    public function __construct()
    {
        $this->middleware(RedirectIfCartEmpty::class);
    }

    public function __invoke(CartInterface $cart)
    {
        try {
            $cart->verifyAvailableQuantities();
        } catch (QuantityNoLongerAvailableException $e) {
            $cart->syncAvailableQuantities();
        }

        return view('checkout');
    }
}
