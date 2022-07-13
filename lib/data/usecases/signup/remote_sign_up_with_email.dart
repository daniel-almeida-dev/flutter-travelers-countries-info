import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/usecases/signup/sign_up_with_email.dart';

class RemoteSignUpWithEmail extends SignUpWithEmail {
  RemoteSignUpWithEmail({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<User?> execute(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      return null;
    }
  }
}
