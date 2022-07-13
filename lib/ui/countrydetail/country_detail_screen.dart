import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/presentation/countrydetail/country_detail_presenter.dart';

class CountryDetailScreen extends StatelessWidget {
  static const String id = '/countryDetail';

  final CountryDetailPresenter presenter;

  const CountryDetailScreen({Key? key, required this.presenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            var country = presenter.country.value;

            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: const Color.fromARGB(255, 245, 245, 245),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(country.flag),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Text(
                      country.portugueseName,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
