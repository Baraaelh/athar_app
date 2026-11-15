# أثر – Athar

تطبيق كفالات إنسانية مبني بـ **Flutter** باستخدام **Clean Architecture** وإدارة الحالة **Cubit (flutter_bloc)**.

## الواجهات
1. **الترحيب / اختيار نوع الحساب** – `features/onboarding`
2. **إنشاء حساب متبرع** – `features/auth`
3. **الرئيسية** (الفئات + الكفالات + شريط التنقل السفلي) – `features/home` و `features/main_shell`

## المعمارية

```
lib/
├── main.dart / app.dart
├── core/
│   ├── constants/   (AppStrings, AppAssets)
│   ├── di/          (get_it service locator)
│   ├── error/       (Failure, Result)
│   ├── routing/     (Routes, AppRouter)
│   ├── theme/       (AppColors, AppTextStyles, AppTheme)
│   ├── utils/       (Validators)
│   └── widgets/     (PrimaryButton, AppTextField, AppImage, ...)
└── features/
    └── <feature>/
        ├── domain/        entities • repositories (abstract) • usecases
        ├── data/          models • datasources • repositories (impl)
        └── presentation/  cubit • pages • widgets
```

- **Domain** لا يعتمد على Flutter ولا على أي طبقة أخرى.
- **Data** تطبق عقود الـ Domain (حالياً بيانات وهمية – استبدل `datasources` بـ API حقيقي فقط).
- **Presentation** تتواصل مع الـ Domain عبر الـ UseCases داخل الـ Cubits.

## الصور والأيقونات
كل المسارات معرّفة في `lib/core/constants/app_assets.dart`:

| الملف | الاستخدام |
|---|---|
| `assets/images/logo.png` | شعار أثر في هيدر الرئيسية |
| `assets/images/sprout.png` | النبتة في الرئيسية |
| `assets/images/orphan_baby.png` | كفالة يتيم |
| `assets/images/university_student.png` | كفالة طالب جامعي |
| `assets/icons/donor.png` | أيقونة متبرع / متابع |
| `assets/icons/organization.png` | أيقونة جمعية / منظمة |

## التشغيل
```bash
flutter pub get
flutter run
```
