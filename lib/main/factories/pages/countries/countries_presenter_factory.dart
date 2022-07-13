import 'package:projeto_final_flutter/main/factories/usecases/countries/remote_fetch_all_countries_factory.dart';
import 'package:projeto_final_flutter/main/factories/usecases/countries/remote_fetch_country_detail_factory.dart';
import 'package:projeto_final_flutter/presentation/countries/countries_presenter.dart';

import '../../usecases/signout/remote_sign_out_from_application_factory.dart';

CountriesPresenter makeCountriesPresenter() => CountriesPresenter(
      fetchAllCountries: makeRemoteFetchAllCountries(),
      fetchCountryDetail: makeRemoteFetchCountryDetail(),
      signOutFromApplication: makeRemoteSignOutFromApplication(),
    );
