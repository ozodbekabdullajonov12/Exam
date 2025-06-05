import '../../core/client.dart';
import '../../core/secure_storage.dart';
import '../models/create_user_model.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

  Future<bool> login({required String phoneNumber, required String password}) async {
    final result = await client.login(phoneNumber: phoneNumber, password: password);
    if (result["result"]) {
      await SecureStorage.deleteCredentials();
      await SecureStorage.saveCredentials(login: phoneNumber, password: password);
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token: result["token"]);
    }
    return result["result"];
  }

  Future logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials!['login'] == null || credentials["password"] == null) {
      return false;
    } else {
      var jwt = await client.login(
        phoneNumber: credentials['login']!,
        password: credentials["password"]!,
      );
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token: jwt["token"]);
      return true;
    }
  }

  Future<bool> signUp({
    required String firstName,
    required String email,
    required String lastName,
    required String password,
    required String phoneNumber,
  }) async {
    final result = await client.signUp(
      user: CreateUserModel(
        password: password,
        email: email,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastname: lastName,
      ),
    );

    if (result["result"]) {
      SecureStorage.deleteToken();
      SecureStorage.saveToken(token: result["token"]);
      SecureStorage.deleteCredentials();
      SecureStorage.saveCredentials(login: email, password: password);
      return true;
    } else {
      return false;
    }
  }
}
