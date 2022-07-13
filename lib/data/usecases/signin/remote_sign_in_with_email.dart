import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/usecases/signin/sign_in_with_email.dart';

class RemoteSignInWithEmail extends SignInWithEmail {
  RemoteSignInWithEmail({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  Future<User?> execute(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      return null;
    }
  }
}
