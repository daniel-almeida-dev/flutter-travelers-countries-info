import 'package:projeto_final_flutter/main/factories/usecases/signout/remote_sign_out_from_application_factory.dart';

import '../../../../presentation/signup/sign_up_presenter.dart';
import '../../usecases/signup/remote_sign_up_with_email_factory.dart';

SignUpPresenter makeSignUpPresenter() => SignUpPresenter(
      signUpWithEmail: makeRemoteSignUpWithEmail(),
      signOutFromApplication: makeRemoteSignOutFromApplication(),
    );
