import '../index.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    final result = post(
      path,
      {
        'username': data.username,
        'password': data.password,
      },
      contentType: 'application/x-www-form-urlencoded',
    );

    return result;
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }
}
