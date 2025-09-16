class EmailValidator {
  static bool isValid(String email) {
    if (email.isEmpty) {
      return false;
    }

    return email.contains('@');
  }
}
