import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../presentation/countrydetail/country_detail_presenter.dart';
import '../../../../ui/countrydetail/country_detail_screen.dart';
import 'country_detail_presenter_factory.dart';

Widget makeCountryDetailScreen() {
  final presenter = Get.put<CountryDetailPresenter>(makeCountryDetailPresenter());
  return CountryDetailScreen(presenter: presenter);
}