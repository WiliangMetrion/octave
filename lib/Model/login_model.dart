import '../utils/api.dart';

class LoginModel {
  String? dataUser;
  String? dataPass;

  LoginModel(this.dataUser, this.dataPass);

  LoginModel.fromJson(Map<String, dynamic> json) {
    dataUser = json['username'];
    dataPass = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = dataUser;
    data['password'] = dataPass;
    return data;
  }

  static Future<String?> getUserName(String? userData, String? userPass) async {
    var data =
        await API.getData('Octave/users?username=$userData&password=$userPass');
    return data['username'];
  }

  static Future<String?> getUserPass(String? userData, String? userPass) async {
    var data =
        await API.getData('Octave/users?username=$userData&password=$userPass');
    return data['password'];
  }
}
