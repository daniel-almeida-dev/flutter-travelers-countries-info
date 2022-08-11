import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_final_flutter/data/usecases/countries/service/remote_fetch_all_countries.dart';
import 'package:projeto_final_flutter/data/usecases/countries/service/remote_fetch_country_detail.dart';
import 'package:projeto_final_flutter/data/usecases/signout/remote_sign_out_from_application.dart';
import 'package:projeto_final_flutter/presentation/countries/countries_presenter.dart';
import 'package:projeto_final_flutter/ui/countries/countries_screen.dart';

import 'data/usecases/countries/remote_fetch_all_countries_test.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {

}

class CountriesPresenterMock extends Mock implements CountriesPresenter {
  CountriesPresenterMock() {
    CountriesPresenter(
        fetchAllCountries: RemoteFetchAllCountries(httpClient: HttpClientMock()),
        signOutFromApplication: RemoteSignOutFromApplication(firebaseAuth: FirebaseAuthMock()),
        fetchCountryDetail: RemoteFetchCountryDetail(httpClient: HttpClientMock()));
  }
}

void main() {
  late CountriesScreen sut;
  late CountriesPresenterMock presenter;

  setUp(() {
    presenter = CountriesPresenterMock();
    sut = CountriesScreen(presenter: presenter);
  });

  test('Should have presenter', () async {
    verify(() => sut.presenter;
  });
}