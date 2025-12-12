import 'package:vehicle_rental_app/core/resources/string.dart';

class AppValidators {
  static String? validateText(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emptyField;
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
      return AppStrings.noCharacterAllowed;
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emptyField;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return AppStrings.numbersAllowed;
    }
    return null;
  }
}
