import 'package:octave/utils/stringext.dart';
import '../Model/login_model.dart';

class LoginViewModel {
  final String? username;
  final String? password;

  LoginViewModel(this.username, this.password);

  factory LoginViewModel.login() {
    return LoginViewModel(null, null);
  }

  Future<bool> get userValid async {
    String? data = await LoginModel.getUserName(username, password);
    return data == username;
  }

  Future<bool> get passwordValid async {
    String? data = await LoginModel.getUserPass(username, password);
    return data == password;
  }

  Future<bool> isValid() async {
    var valid = await userValid && await passwordValid;
    return valid;
  }

  String? userValidator(String? username) {
    if (username == null || username.isWhiteSpace()) {
      return 'Please input your username';
    }
    if (!username.isValidName()) {
      return 'User only consist of Alphabet';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isWhiteSpace()) {
      return 'Please input your password';
    }
    if (!password.isValidPassword()) {
      return 'Password invalid format';
    }
    return null;
  }

  LoginViewModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginViewModel(username ?? this.username, password ?? this.password);
  }

  @override
  String toString() => "LoginViewModel($username, $password)";
}
