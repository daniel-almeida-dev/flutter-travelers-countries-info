import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/usecases/signin/remote_sign_in_with_email.dart';

RemoteSignInWithEmail makeRemoteSignInWithEmail() => RemoteSignInWithEmail(
      firebaseAuth: FirebaseAuth.instance,
    );
