class Validators {
  Validators._();

  static String? required(String? value, {String message = 'This field is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? minLength(String? value, int minLength, {String? message}) {
    if (value == null || value.length < minLength) {
      return message ?? 'Must be at least $minLength characters';
    }
    return null;
  }

  static String? numeric(String? value, {String message = 'Enter a valid number'}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null) {
      return message;
    }
    return null;
  }
}
