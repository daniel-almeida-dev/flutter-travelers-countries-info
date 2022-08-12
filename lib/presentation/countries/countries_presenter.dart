import 'package:get/get.dart';
import 'package:projeto_final_flutter/domain/entities/country.dart';
import 'package:projeto_final_flutter/domain/exceptions/unexpected_exception.dart';
import 'package:projeto_final_flutter/domain/usecases/countries/fetch_all_countries.dart';
import 'package:projeto_final_flutter/domain/usecases/countries/fetch_country_detail.dart';
import 'package:projeto_final_flutter/domain/usecases/signout/sign_out_from_application.dart';

import '../../domain/utils/string_utils.dart';
import '../../ui/countrydetail/country_detail_screen.dart';
import '../../ui/signin/sign_in_screen.dart';
import '../utils/loading_state.dart';

class CountriesPresenter extends GetxController {
  final FetchAllCountries fetchAllCountries;
  final FetchCountryDetail fetchCountryDetail;
  final SignOutFromApplication signOutFromApplication;

  RxString errorMessage = RxString('');
  Rx<LoadingState> loadingState = Rx<LoadingState>(LoadingState.loaded);
  Rx<LoadingState> loadingListState = Rx<LoadingState>(LoadingState.loading);
  Rx<List<Country>> countriesList = Rx<List<Country>>([]);

  List<Country> countriesCopyList = List<Country>.empty();

  CountriesPresenter({
    required this.fetchAllCountries,
    required this.fetchCountryDetail,
    required this.signOutFromApplication,
  });

  @override
  void onInit() async {
    super.onInit();

    try {
      countriesList.value = await fetchAllCountries.execute();

      countriesCopyList = countriesList.value;

      loadingListState.value = LoadingState.loaded;
    } on UnexpectedException catch (_) {
      loadingState.value = LoadingState.loaded;

      errorMessage.value =
          "Ocorreu um erro ao tentar carregar a lista de paises";
    }
  }

  void filterCountries(String countryName) {
    countriesList.value = countriesCopyList
        .where((country) => StringUtils.toNoPalatals(
        country.portugueseName.toString().toLowerCase())
        .toLowerCase()
        .contains(
        StringUtils.toNoPalatals(countryName.toLowerCase()).toLowerCase()))
        .toList();
  }

  void onItemListTapped(String countryName) async {
    loadingState.value = LoadingState.loading;

    try {
      var country = await fetchCountryDetail.execute(countryName);

      Future.delayed(const Duration(milliseconds: 250), () {
        loadingState.value = LoadingState.loaded;

        Future.delayed(const Duration(milliseconds: 250), () {
          Get.toNamed(CountryDetailScreen.id, arguments: [
            {"country": country}
          ]);
        });
      });
    } on UnexpectedException catch (_) {
      loadingState.value = LoadingState.loaded;

      errorMessage.value =
          "Ocorreu um erro ao tentar carregar os detalhes do pais ${countryName}";
    }
  }

  void onAppBarBackButtonPressed() async {
    await signOutFromApplication.execute();

    Get.offAllNamed(SignInScreen.id);
  }
}
