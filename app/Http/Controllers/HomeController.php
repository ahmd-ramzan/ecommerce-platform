<?php

namespace App\Http\Controllers;

use App\Cart\Contracts\CartInterface;
use App\Models\Category;

class HomeController extends Controller
{
    public function __invoke(CartInterface $cart)
    {
        dd($cart->create());
        $categories = Category::tree()->get()->toTree();

        return view('home', get_defined_vars());
    }
}
