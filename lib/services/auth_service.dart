import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<User?> registerUser(String email, String password, String username);
  Future<User?> loginUser(String email, String password);
  Future<void> logoutUser();
  Stream<User?> onAuthChanges();
  get currentUser;
}

class Auth implements AuthInterface {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  @override
  Future<User?> registerUser(String email, String password, String username) async {
    final userCredentials =
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await _db
        .collection('users')
        .doc(userCredentials.user!.uid)
        .set({'email': email, 'username': username, 'createdAt': DateTime.now()});
    return userCredentials.user;
  }

  @override
  Future<User?> loginUser(String email, String password) async {
    final userCredentials =
        await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredentials.user;
  }

  @override
  Future<void> logoutUser() async => await _auth.signOut();

  @override
  Stream<User?> onAuthChanges() => _auth.authStateChanges();

  @override
  get currentUser => _auth.currentUser;
}
