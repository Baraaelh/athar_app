import '../constants/app_strings.dart';

/// Pure form validators, reusable across features.
abstract final class Validators {
  static final RegExp _email = RegExp(r'^[\w\.\-+]+@[\w\-]+\.[\w\.\-]+$');
  static final RegExp _phone = RegExp(r'^\+?[0-9]{8,15}$');

  static String? required(String? value) =>
      (value == null || value.trim().isEmpty) ? AppStrings.requiredField : null;

  static String? email(String? value) {
    final error = required(value);
    if (error != null) return error;
    return _email.hasMatch(value!.trim()) ? null : AppStrings.invalidEmail;
  }

  static String? phone(String? value) {
    final error = required(value);
    if (error != null) return error;
    return _phone.hasMatch(value!.replaceAll(' ', '')) ? null : AppStrings.invalidPhone;
  }

  static String? password(String? value) {
    final error = required(value);
    if (error != null) return error;
    return value!.length < 8 ? AppStrings.shortPassword : null;
  }

  static String? confirmPassword(String? value, String original) {
    final error = required(value);
    if (error != null) return error;
    return value != original ? AppStrings.passwordsMismatch : null;
  }
}
