import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/main/factories/pages/signup/sign_up_presenter_factory.dart';

import '../../../../presentation/signup/sign_up_presenter.dart';
import '../../../../ui/signup/sign_up_screen.dart';

Widget makeSignUpScreen() {
  final presenter = Get.put<SignUpPresenter>(makeSignUpPresenter());
  return SignUpScreen(
    presenter: presenter,
  );
}
