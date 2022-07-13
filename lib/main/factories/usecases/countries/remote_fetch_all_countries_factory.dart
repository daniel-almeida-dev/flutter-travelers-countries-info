import '../../../../data/usecases/countries/service/remote_fetch_all_countries.dart';
import '../../infra/http/http_adapter_factory.dart';

RemoteFetchAllCountries makeRemoteFetchAllCountries() => RemoteFetchAllCountries(
  httpClient: makeHttpAdapter(),
);