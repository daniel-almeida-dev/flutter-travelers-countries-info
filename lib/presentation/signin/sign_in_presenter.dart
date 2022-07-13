import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:projeto_final_flutter/ui/signup/sign_up_screen.dart';
import '../../domain/usecases/signin/sign_in_with_email.dart';
import '../../ui/countries/countries_screen.dart';
import '../utils/loading_state.dart';

class SignInPresenter extends GetxController {
  final SignInWithEmail signInWithEmail;

  SignInPresenter({required this.signInWithEmail});

  RxString createdEmail = RxString('');
  RxString errorMessage = RxString('');
  Rx<LoadingState> loadingState = Rx<LoadingState>(LoadingState.loaded);

  var userEmail = '';
  var userPassword = '';

  void onUserEmailUpdate(String email) {
    userEmail = email;
  }

  void onPasswordUpdate(String password) {
    userPassword = password;
  }

  String? validateLogin() {
    if ((userEmail == null || userEmail.isEmpty) &&
        (userPassword == null || userPassword.isEmpty)) {
      return "Email e senha não informados!";
    } else if (userEmail == null || userEmail.isEmpty) {
      return "Favor informe seu email!";
    } else if (userPassword == null || userPassword.isEmpty) {
      return "Favor informe sua senha!";
    } else if (!EmailValidator.validate(userEmail)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  void onSignInButtonPressed() async {
    var loginValidator = validateLogin();

    if (loginValidator != null) {
      errorMessage.value = loginValidator;
    } else {
      loadingState.value = LoadingState.loading;

      var user = await signInWithEmail.execute(userEmail, userPassword);

      loadingState.value = LoadingState.loaded;

      if (user == null) {
        errorMessage.value = 'Ocorreu um erro ao tentar realizar o login';
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offNamed(CountriesScreen.id);
        });
      }
    }
  }

  void onSignUpButtonPressed() {
    Get.toNamed(SignUpScreen.id)?.then((result) {
      String? email = result[0]["createdEMail"];

      if (email?.isNotEmpty ?? true) {
        userEmail = result[0]["createdEmail"];
        createdEmail.value = result[0]["createdEmail"];
      }
    });
  }
}
