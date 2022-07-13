import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpWithEmail {
  Future<User?> execute(String email, String password);
}