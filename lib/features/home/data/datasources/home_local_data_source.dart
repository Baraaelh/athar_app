import '../../../../core/constants/app_assets.dart';
import '../models/category_model.dart';
import '../models/sponsorship_model.dart';

abstract interface class HomeLocalDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<SponsorshipModel>> getSponsorships();
}

/// Mock data source. Swap with a remote one when the API is available.
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const _categories = [
    {'type': 'orphans', 'title': 'أيتام', 'description': 'أطفال ينتظرون كفالتك'},
    {'type': 'students', 'title': 'طلاب جامعة', 'description': 'ادعم تعليمهم لمستقبل أفضل'},
    {'type': 'families', 'title': 'أسر محتاجة', 'description': 'ساعد اسرة تعيش ظروف صعبة'},
    {'type': 'patients', 'title': 'مرضى', 'description': 'كن عونا لهم في رحلة العلاج'},
  ];

  static const _sponsorships = [
    {
      'id': '1',
      'title': 'كفالة يتيم في قطاع غزة',
      'description': 'طفل يتيم فقد والده ويحتاج إلى كفالة شهرية تؤمن احتياجاته الأساسية',
      'organization': 'rohamaa',
      'image': AppAssets.orphanBaby,
      'monthly_amount': 500,
      'category': 'orphans',
      'category_label': 'يتيم',
      'is_sponsored': false,
    },
    {
      'id': '2',
      'title': 'كفالة طالب جامعي',
      'description': 'طالب جامعي يسعى لاكمال تعليمه العالي لكنه يواجه صعوبات مادية',
      'organization': 'الامل',
      'image': AppAssets.universityStudent,
      'monthly_amount': 500,
      'category': 'students',
      'category_label': 'طالب',
      'is_sponsored': true,
    },
    {
      'id': '3',
      'title': 'كفالة أسرة محتاجة',
      'description': 'أسرة مكونة من ستة أفراد تعيش ظروفا صعبة وتحتاج إلى دعم شهري',
      'organization': 'الخير',
      'image': AppAssets.familyCase,
      'monthly_amount': 700,
      'category': 'families',
      'category_label': 'أسرة',
      'is_sponsored': false,
    },
    {
      'id': '4',
      'title': 'علاج مريض',
      'description': 'مريض بحاجة إلى تكاليف علاج شهرية مستمرة لتجاوز مرضه',
      'organization': 'الشفاء',
      'image': AppAssets.patientCase,
      'monthly_amount': 400,
      'category': 'patients',
      'category_label': 'مريض',
      'is_sponsored': false,
    },
  ];

  @override
  Future<List<CategoryModel>> getCategories() async =>
      _categories.map(CategoryModel.fromJson).toList();

  @override
  Future<List<SponsorshipModel>> getSponsorships() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return _sponsorships.map(SponsorshipModel.fromJson).toList();
  }
}
