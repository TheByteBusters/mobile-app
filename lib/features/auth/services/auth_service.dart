class AuthService {
  static String password = '';

  static String? validateFullName(String? value) {
    if (value == '' || value == null) {
      return 'must provide your full name';
    }

    RegExp regExp = RegExp(r'^[a-zA-Z]{4,}(?: [a-zA-Z]+){2}$');
    bool doesMatch = regExp.hasMatch(value);

    if (!doesMatch) {
      return 'your full name must contain alphabetical letters only';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == '' || value == null) {
      return 'must provide email address';
    }

    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var doesMatch = regExp.hasMatch(value);

    if (!doesMatch) {
      return 'you must provide a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == '' || value == null) {
      return 'must provide a password';
    }

    if (value.length < 8) {
      return 'your password must be at least 8 characters';
    }

    password = value;
    return null;
  }

  static String? validateConfirmPassword(String? value) {
    if (value == '' || value == null) {
      return 'must provide a password';
    }

    if (value.length < 8) {
      return 'your password must be at least 8 characters';
    }

    if (password != value) {
      return 'your password doesn\'t match';
    }

    return null;
  }

  static String? validatePhoneNumber(String? number) {
    if (number == '' || number == null) {
      return 'you must provide a number';
    }

    if (number.length != 10) {
      return 'you must provide a valide number';
    }

    return null;
  }

  static bool validateBrithDate(String date) {
    return date != '';
  }
}
