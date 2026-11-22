# Book Lending App

- `backend/` — Laravel API
- `mobile/` — Flutter app

## تشغيل الباك إند

```bash
cd backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve
```

> عدّل إعدادات قاعدة البيانات في `.env` قبل `migrate` (DB_DATABASE=book_lending)

## تشغيل الموبايل

```bash
cd mobile
flutter pub get
flutter run            # محاكي أندرويد
flutter run -d chrome  # المتصفح
```

## قواعد العمل

- لا أحد يرفع مباشرة على `main` أو `develop`
- كل ميزة في فرع: `feature/اسم-الميزة`
- افتح Pull Request إلى `develop`
