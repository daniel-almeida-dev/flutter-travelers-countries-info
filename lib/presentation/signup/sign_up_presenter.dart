import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

import '../../domain/usecases/signout/sign_out_from_application.dart';
import '../../domain/usecases/signup/sign_up_with_email.dart';
import '../utils/loading_state.dart';

class SignUpPresenter extends GetxController {
  var userName = '';
  var userPhone = '';
  var userEmail = '';
  var userPassword = '';

  RxString errorMessage = RxString('');
  Rx<LoadingState> loadingState = Rx<LoadingState>(LoadingState.loaded);

  final SignUpWithEmail signUpWithEmail;
  final SignOutFromApplication signOutFromApplication;

  SignUpPresenter({required this.signUpWithEmail, required this.signOutFromApplication});

  void onUserNameUpdate(String name) {
    userName = name;
  }

  void onUserPhoneUpdate(String phone) {
    userPhone = phone;
  }

  void onUserEmailUpdate(String email) {
    userEmail = email;
  }

  void onPasswordUpdate(String password) {
    userPassword = password;
  }

  String? validateRegister() {
    if (userName == null ||
        userName.isEmpty ||
        userPhone == null ||
        userPhone.isEmpty ||
        userEmail == null ||
        userEmail.isEmpty ||
        userPassword == null ||
        userPassword.isEmpty) {
      return "Favor preencha todos os campos!";
    } else if (!EmailValidator.validate(userEmail)) {
      return "Email inválido!";
    } else if (userPassword.length < 6) {
      return "A senha deve conter no mínimo 6 caracteres!";
    } else {
      return null;
    }
  }

  void onAppBarBackButtonPressed() {
    Get.back();
  }

  void onSignUpButtonPressed() async {
    var registerValidator = validateRegister();

    if (registerValidator != null) {
      errorMessage.value = registerValidator;
    } else {
      loadingState.value = LoadingState.loading;

      var user = await signUpWithEmail.execute(userEmail, userPassword);

      loadingState.value = LoadingState.loaded;

      if (user == null) {
        errorMessage.value = 'Ocorreu um erro ao tentar realizar o cadastro';
      } else {
        await signOutFromApplication.execute();

        Get.back(result: [
          {"createdEmail": userEmail}
        ]);
      }
    }
  }
}
