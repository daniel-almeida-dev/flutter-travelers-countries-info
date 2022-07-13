import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_final_flutter/data/usecases/signout/remote_sign_out_from_application.dart';

RemoteSignOutFromApplication makeRemoteSignOutFromApplication() => RemoteSignOutFromApplication(
  firebaseAuth: FirebaseAuth.instance,
);