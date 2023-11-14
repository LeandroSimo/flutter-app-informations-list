extension Emailvalidator on String {
  bool isValidUser() {
    return RegExp(r'\s').hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }
}
