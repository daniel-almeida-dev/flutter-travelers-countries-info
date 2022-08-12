import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_final_flutter/presentation/countries/countries_presenter.dart';
import 'package:projeto_final_flutter/ui/common/common_screen.dart';
import 'package:projeto_final_flutter/ui/countries/widgets/rounded_search_text_form_field.dart';
import 'package:projeto_final_flutter/ui/countries/widgets/topped_logo.dart';

import '../../presentation/utils/loading_state.dart';

//ignore: must_be_immutable
class CountriesScreen extends CommonScreen {
  static const String id = '/countries';

  final CountriesPresenter presenter;

  CountriesScreen({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          elevation: 0,
          leading: BackButton(
            color: const Color.fromARGB(255, 46, 165, 188),
            onPressed: () {
              presenter.onAppBarBackButtonPressed();
            },
          ),
        ),
        body: SafeArea(
          child: Obx(
            () {
              var loadingState = presenter.loadingState.value;
              loadingState == LoadingState.loading
                  ? showLoading(context, "Carregando...")
                  : cancelLoading();

              var loadingListState = presenter.loadingListState.value;

              var errorMessage = presenter.errorMessage.value;
              if (errorMessage.isNotEmpty) {
                showError(errorMessage);
              }

              return Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      color: const Color.fromARGB(255, 245, 245, 245),
                      child: const Center(
                        child: ToppedLogo(),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: const Color.fromARGB(255, 245, 245, 245),
                      child: Center(
                        child: Visibility(
                          visible: loadingListState == LoadingState.loading ? false : true,
                          child: RoundedSearchTextFormField(onTextChanged: presenter.filterCountries),
                        ),
                      ),
                    ),
                    Expanded(
                      child: loadingListState == LoadingState.loading
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset('assets/anim/loading.json'),
                                const Text(
                                  "Carregando lista de paises...",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            )
                          : ListView.separated(
                              itemCount: presenter.countriesList.value.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 2),
                              itemBuilder: (context, index) {
                                final country =
                                    presenter.countriesList.value[index];

                                return InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    presenter.onItemListTapped(country.name);
                                  },
                                  child: ListTile(
                                    tileColor: Colors.white,
                                    leading: Container(
                                      width: 50,
                                      height: 37,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(country.flag),
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      country.portugueseName,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    trailing: const Icon(
                                      Icons.chevron_right,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
