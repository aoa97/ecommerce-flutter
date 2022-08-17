import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier {
  final AuthInterface auth;
  String email;
  String password;
  String username;
  AuthFormType authFormType;

  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.username = '',
    this.authFormType = AuthFormType.login,
  });

  void copyWith({String? email, String? password, String? username, AuthFormType? authFormType}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.username = username ?? this.username;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  updateEmail(String email) => copyWith(email: email);

  updateUsername(String username) => copyWith(username: username);

  updatePassword(String password) => copyWith(password: password);

  toggleFormType() {
    final type = authFormType == AuthFormType.login ? AuthFormType.register : AuthFormType.login;
    copyWith(email: '', password: '', username: '', authFormType: type);
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginUser(email, password);
      } else {
        await auth.registerUser(email, password, username);
      }
    } catch (e) {
      rethrow;
    }
  }
}
