import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/main/factories/pages/countries/countries_presenter_factory.dart';
import 'package:projeto_final_flutter/presentation/countries/countries_presenter.dart';

import '../../../../ui/countries/countries_screen.dart';

Widget makeCountriesScreen() {
  final presenter = Get.put<CountriesPresenter>(makeCountriesPresenter());
  return CountriesScreen(presenter: presenter);
}
