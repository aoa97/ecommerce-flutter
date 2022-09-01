import 'package:ecommerce_app/services/db_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  AuthServices._();

  static final instance = AuthServices._();
  final _auth = FirebaseAuth.instance;
  final db = DBServices.instance;

  Future<void> register(String email, String password, String name) async {
    final userData = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final id = userData.user!.uid;
    userData.user!.updateDisplayName(name);
    await db.setData(
        path: 'users/$id',
        data: {'email': email, 'name': name, 'createdAt': DateTime.now()});
  }

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Stream<User?> authStateStream() {
    return _auth.authStateChanges();
  }

  get currentUser {
    return _auth.currentUser;
  }
}
