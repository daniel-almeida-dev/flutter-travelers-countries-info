import 'package:projeto_final_flutter/domain/entities/country.dart';
import 'package:projeto_final_flutter/domain/exceptions/unexpected_exception.dart';

import '../../../../domain/usecases/countries/fetch_country_detail.dart';
import '../../../http/http_client.dart';
import '../../../http/http_error.dart';
import '../model/country_model.dart';

class RemoteFetchCountryDetail extends FetchCountryDetail {
  RemoteFetchCountryDetail({
    required this.httpClient,
  });

  final HttpClient httpClient;

  @override
  Future<Country> execute(String countryName) async {
    try {
      final response = await httpClient.get(
          url: 'https://restcountries.com/v2/name/$countryName');

      final singleCountryList = response
          ?.map<Country>(
              (json) => CountryModel.fromJson(json).toEntitySimpleInfo())
          .toList();

      if (singleCountryList == null) {
        throw UnexpectedException();
      }

      return singleCountryList[0];
    } on HttpError catch (_) {
      throw UnexpectedException();
    }
  }
}
