import '../../entities/country.dart';

abstract class FetchCountryDetail {

  Future<Country> execute(String countryName);
}