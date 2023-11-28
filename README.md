
## E-commerce platform

Robust e-commerce platform with a Laravel and Livewire. Features products with unlimited and flexible variations, a product browser with filters and price range slider, global product search, guest checkout, shipping and payment implementation, order status tracking and more

## Meilisearch for intuitive search experience
- **sudo apt update && sudo apt install meilisearch**
- **php artisan scout:import "App\Models\Product"**

## Mailhog for local email testing
- **sudo apt-get -y install golang-go**
- **go install github.com/mailhog/MailHog@latest"**
- **~/go/bin/MailHog"**

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

MAIL_MAILER=smtp  
MAIL_HOST=localhost  
MAIL_FROM_ADDRESS="mail@example.com"  
STRIPE_KEY=YOUR_STRIPE_KEY  
STRIPE_SECRET=YOUR_STRIPE_SECRET_KEY
