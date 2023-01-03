extension StringExtention on String {
  bool isWhiteSpace() => this.trim().isEmpty;

  bool isValidPassword() => this.length > 2;

  bool isValidName() {
    return RegExp('[a-zA-Z]').hasMatch(this);
  }
}
