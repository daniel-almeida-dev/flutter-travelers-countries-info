import '../../entities/country.dart';

abstract class FetchAllCountries {

  Future<List<Country>> execute();
}