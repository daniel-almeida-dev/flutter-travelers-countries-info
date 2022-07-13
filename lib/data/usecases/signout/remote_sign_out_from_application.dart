import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_final_flutter/domain/exceptions/unexpected_exception.dart';
import 'package:projeto_final_flutter/domain/usecases/signout/sign_out_from_application.dart';

class RemoteSignOutFromApplication extends SignOutFromApplication {
  RemoteSignOutFromApplication({
    required this.firebaseAuth,
  });

  FirebaseAuth firebaseAuth;

  @override
  Future<void> execute() async {
    try {
      await firebaseAuth.signOut();
    } catch (error) {
      throw UnexpectedException();
    }
  }
}
