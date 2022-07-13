import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/main/factories/pages/signin/sign_in_presenter_factory.dart';

import '../../../../presentation/signin/sign_in_presenter.dart';
import '../../../../ui/signin/sign_in_screen.dart';

Widget makeSignInScreen() {
  final presenter = Get.put<SignInPresenter>(makeSignInPresenter());
  return SignInScreen(
    presenter: presenter,
    controller: TextEditingController(),
  );
}
