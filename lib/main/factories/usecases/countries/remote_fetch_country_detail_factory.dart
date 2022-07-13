import 'package:projeto_final_flutter/data/usecases/countries/service/remote_fetch_country_detail.dart';

import '../../infra/http/http_adapter_factory.dart';

RemoteFetchCountryDetail makeRemoteFetchCountryDetail() => RemoteFetchCountryDetail(
  httpClient: makeHttpAdapter(),
);