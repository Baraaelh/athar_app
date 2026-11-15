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

## إدارة الحالة (Cubit)

| Cubit | الملف | الحالة |
|---|---|---|
| `RegisterCubit` | `features/auth/presentation/cubit/register_cubit.dart` | حالة الإرسال (loading/success/failure) + إظهار/إخفاء كلمتي المرور |
| `HomeCubit` | `features/home/presentation/cubit/home_cubit.dart` | تحميل الفئات والكفالات + فلترة البحث |
| `MainShellCubit` | `features/main_shell/presentation/cubit/main_shell_cubit.dart` | التبويب المختار في الشريط السفلي |

تُنشأ الـ Cubits في `core/routing/app_router.dart` عبر `BlocProvider` من الـ service locator،
والواجهات تقرأ الحالة بـ `BlocBuilder` / `BlocListener` وتستدعي الدوال بـ `context.read<...>()`.

## الخط
خط **Alexandria** مضمّن داخل `assets/fonts` (ترخيص OFL)، لا يحتاج إنترنت.

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

## الاختبارات
`test/responsive_layout_test.dart` يفتح كل شاشة على عدة مقاسات (320×568 حتى 800×1280)
ومع تكبير خط 1.3x، ويفشل إذا حصل أي overflow:
```bash
flutter test
```
