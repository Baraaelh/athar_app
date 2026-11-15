/// Paths of every local asset used in the app.
///
/// Drop the exported design images into `assets/images/` with these names.
/// Until they exist, [AppImage] shows a graceful placeholder.
abstract final class AppAssets {
  static const String _images = 'assets/images';

  static const String sprout = '$_images/sprout.png';
  static const String orphanBaby = '$_images/orphan_baby.png';
  static const String universityStudent = '$_images/university_student.png';
  static const String familyCase = '$_images/family_case.png';
  static const String patientCase = '$_images/patient_case.png';
}
