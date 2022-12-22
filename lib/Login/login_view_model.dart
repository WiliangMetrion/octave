import '../utils/stringext.dart';
import '../api.dart';

class LoginViewModel {
  final String? username;
  final String? password;

  LoginViewModel(this.username, this.password);

  factory LoginViewModel.login() {
    return LoginViewModel(null, null);
  }

  bool get userIsValid => userValidator(username, getUser(username)) == null;
  bool get passwordIsValid =>
      passwordValidator(password, getUser(username)) == null;

  bool isValid() => userIsValid && passwordIsValid;

  Future<String?> getUser(String? username) async {
    var data = await API.post('/users', {"name": username});
    return data;
  }

  String? userValidator(String? username, dynamic data) {
    if (username == null || username.isWhiteSpace()) {
      return 'Please input your username';
    }
    if (data['user'] != username) {
      return "User doesn't exist";
    }
    return null;
  }

  String? passwordValidator(String? password, dynamic data) {
    if (password == null || password.isWhiteSpace()) {
      return 'Please input your username';
    }
    if (data['password'] != password) {
      return "Password is not match";
    }
    return null;
  }

  LoginViewModel copyWith(String? username, String? password) {
    return LoginViewModel(username ?? this.username, password ?? this.password);
  }

  @override
  String toString() => 'LoginViewModel($username, $password)';
}
