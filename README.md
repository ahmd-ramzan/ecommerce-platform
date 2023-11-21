
## E-commerce platform

Robust e-commerce platform with a Laravel and Livewire. Features products with unlimited and flexible variations, a product browser with filters and price range slider, global product search, guest checkout, shipping and payment implementation, order status tracking and more

## Meilisearch for intuitive search experience
- **sudo apt update && sudo apt install meilisearch**
- **php artisan scout:import "App\Models\Product"**

## Run following commands in project root
- **composer install**
- **php artisan key:generate**
- **npm run install**
- **php artisan serve**
- **meilisearch**

## Necessary .env configurations
SCOUT_DRIVER=meilisearch  
MEILISEARCH_HOST=http://127.0.0.1:7700  
MEILISEARCH_KEY=masterKey  
