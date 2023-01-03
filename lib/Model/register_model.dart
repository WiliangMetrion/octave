import '../utils/api.dart';

class RegisterModel {
  static register(String username, String password) async {
    await API
        .post('Octave/users', {'username': username, 'password': password});
  }
}
