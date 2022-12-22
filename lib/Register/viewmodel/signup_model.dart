import 'package:octave/utils/stringext.dart';

class SignUpViewModel {
  final String? username;
  final String? password;

  SignUpViewModel(this.username, this.password);

  factory SignUpViewModel.newUser() {
    return SignUpViewModel(null, null);
  }

  bool get userIsValid => userValidator(username) == null;
  bool get passwordIsValid => passwordValidator(password) == null;

  bool isValid() => userIsValid && passwordIsValid;

  String? userValidator(String? username) {
    if (username == null || username.isWhiteSpace()) {
      return 'Please input your username';
    }

    if (!username.isValidName()) {
      return 'Please only input alphabet for username';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isWhiteSpace()) {
      return 'Please input your password';
    }

    if (!password.isValidPassword()) {
      return 'Your password has be more than 10 digits';
    }
    return null;
  }

  SignUpViewModel copyWith({String? username, String? password}) {
    return SignUpViewModel(
        username ?? this.username, password ?? this.password);
  }

  @override
  String toString() => 'SignUpViewModel($username, $password)';
}
