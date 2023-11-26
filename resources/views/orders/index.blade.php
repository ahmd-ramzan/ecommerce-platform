<x-app-layout>
    <x-slot name="header">
        <div class="space-x-1">
            Orders
        </div>
    </x-slot>
    <div class="mx-auto sm:px-6 lg:px-8 py-12 gap-4">
        <div class="max-w-7xl_mx-auto sm:px-6 lg:px-8">
            <div class="overflow-hidden sm: rounded-lg space-y-3">
                @forelse($orders as $order)
                    <div class="bg-white p-6 col-span-4 space-y-3">
                        <div class="border-b pb-3 flex items-center justify-between">
                            <div>#{{ $order->id }}</div>
                            @foreach($order->variations as $variation)
                                <div class="border-b py-3 space-y-2 flex items-center last:border-@ last:pb-0">
                                    <div class="w-16 mr-4">
                                        <img src="{{ $variation->getFirstMediaUrl('default', 'thumb200x200') }}"
                                             class="w-16">
                                    </div>
                                    <div class="space-y-1">
                                        <div>
                                            <div class="font-semibold">{{ $variation->formattedPrice() }}</div>
                                            <div>{{ $variation->product->title }}</div>
                                        </div>
                                        <div class="flex items-center text-sm">
                                            <div class="mr-1 font-semibold">
                                                Quantity: {{ $variation->pivot->quantity }}
                                                <span class="text-gray-400 mx-1">/</span>
                                            </div>
                                            @foreach($variation->ancestorsAndSelf as $ancestor)
                                                {{ $ancestor->title }}
                                                @if(! $loop->last)
                                                    <span class="text-gray-400 mx-1">/</span>
                                                @endif
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                            <div>{{ $order->formattedSubtotal() }}</div>
                            <div>{{ $order->shippingType->title }}</div>
                            <div>{{ $order->created_at->toDateTimeString() }}</div>
                            <span
                                class="inline-flex items-center px-3 py-1 text-sm rounded-full bg-gray-100  text-gray-800">
                                {{ $order->presenter()->status() }}
                            </span>
                        </div>
                    </div>
                @empty
                    No orders
                @endforelse
            </div>
        </div>
    </div>
</x-app-layout>
