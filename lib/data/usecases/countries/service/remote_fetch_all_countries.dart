import 'package:projeto_final_flutter/domain/entities/country.dart';
import 'package:projeto_final_flutter/domain/exceptions/unexpected_exception.dart';
import 'package:projeto_final_flutter/domain/usecases/countries/fetch_all_countries.dart';

import '../../../http/http_client.dart';
import '../../../http/http_error.dart';
import '../model/country_model.dart';

class RemoteFetchAllCountries extends FetchAllCountries {
  RemoteFetchAllCountries({
    required this.httpClient,
  });

  final HttpClient httpClient;

  @override
  Future<List<Country>> execute() async {
    try {
      final response =
          await httpClient.get(url: "https://restcountries.com/v2/all");

      final countriesList = response
          ?.map<Country>((json) => CountryModel.fromJson(json).toEntitySimpleInfo())
          .toList();

      return countriesList ?? [];
    } on HttpError catch (_) {
      throw UnexpectedException();
    }
  }
}
