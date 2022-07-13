import 'package:get/get.dart';
import 'package:projeto_final_flutter/domain/entities/country.dart';

class CountryDetailPresenter extends GetxController {
  Rx<Country> country =
      Rx<Country>(Country(name: "", portugueseName: "", flag: ""));

  CountryDetailPresenter();

  @override
  void onInit() async {
    super.onInit();

    var arguments = Get.arguments;

    country.value = arguments[0]["country"];
  }

  void onAppBarBackButtonPressed() async {
    Get.back();
  }
}
