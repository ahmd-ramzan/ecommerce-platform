<?php

namespace App\Http\Middleware;

use App\Cart\Contracts\CartInterface;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Symfony\Component\HttpFoundation\Response;

class CartMiddleware
{
    public function __construct(protected CartInterface $cart)
    {

    }

    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        //Session::flush();
        if (! $this->cart->exists()) {
            $this->cart->create($request->user());
        }
        return $next($request);
    }
}
