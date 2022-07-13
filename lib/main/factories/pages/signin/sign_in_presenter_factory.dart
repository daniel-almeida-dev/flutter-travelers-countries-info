import '../../../../presentation/signin/sign_in_presenter.dart';
import '../../usecases/signin/remote_sign_in_with_email_factory.dart';

SignInPresenter makeSignInPresenter() =>
    SignInPresenter(signInWithEmail: makeRemoteSignInWithEmail());
