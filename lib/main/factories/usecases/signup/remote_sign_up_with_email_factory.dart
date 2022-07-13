import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/usecases/signup/remote_sign_up_with_email.dart';

RemoteSignUpWithEmail makeRemoteSignUpWithEmail() => RemoteSignUpWithEmail(
      firebaseAuth: FirebaseAuth.instance,
    );
