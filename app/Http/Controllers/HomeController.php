<?php

namespace App\Http\Controllers;

use App\Models\Category;

class HomeController extends Controller
{
    public function __invoke()
    {
        $categories = Category::tree()->get();

        return view('home', get_defined_vars());
    }
}
