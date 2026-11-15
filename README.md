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

## الصور
ضع الصور داخل `assets/images/` بالأسماء الموجودة في `lib/core/constants/app_assets.dart`:

| الملف | الاستخدام |
|---|---|
| `sprout.png` | صورة النبتة في الرئيسية |
| `orphan_baby.png` | كفالة يتيم |
| `university_student.png` | كفالة طالب جامعي |
| `family_case.png` | كفالة أسرة |
| `patient_case.png` | علاج مريض |

إلى حين إضافتها يظهر placeholder تلقائياً.

## التشغيل
```bash
flutter pub get
flutter run
```
