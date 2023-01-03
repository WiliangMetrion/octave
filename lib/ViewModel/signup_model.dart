import 'package:octave/utils/stringext.dart';

import '../Model/register_model.dart';

class SignUpViewModel {
  final String? username;
  final String? password;
  dynamic getData;

  SignUpViewModel(this.username, this.password);

  factory SignUpViewModel.newUser() {
    return SignUpViewModel(null, null);
  }

  bool get userIsValid => userValidator(username) == null;
  bool get passwordIsValid => passwordValidator(password) == null;

  bool isValid() => userIsValid && passwordIsValid;

  createUser(String username, String password) async {
    await RegisterModel.register(username, password);
  }

  String? userValidator(String? username) {
    if (username == null || username.isWhiteSpace()) {
      return 'Please input your username';
    }
    if (!username.isValidName()) {
      return 'Username only consist of Alphabet';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isWhiteSpace()) {
      return "Please input your password";
    }
    if (!password.isValidPassword()) {
      return "Invalid password format";
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
