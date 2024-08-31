class Validations {
  static String? emptyFieldValidation(String value) {
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (regex.hasMatch(value) || value.isEmpty) {
      // Valid email address
      return null;
    } else {
      // Invalid email address
      return 'This Field Cannot be Empty';
    }
  }

  static String? numbersOnlyValidation(String value) {
    final regex = RegExp(r'^\d$');
    if (regex.hasMatch(value) || value.isEmpty) {
      // Valid email address
      return null;
    } else {
      // Invalid email address
      return 'Enter a 16 digit number';
    }
  }
}
