import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/main/factories/pages/start/start_presenter_factory.dart';

import '../../../../presentation/start/start_presenter.dart';
import '../../../../ui/start/start_screen.dart';

Widget makeStartScreen() {
  final presenter = Get.put<StartPresenter>(makeStartPresenter());
  return StartScreen(
    presenter: presenter,
  );
}