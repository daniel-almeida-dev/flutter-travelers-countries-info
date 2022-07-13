import 'package:http/http.dart';

import '../../../../infra/http/http_adapter.dart';

HttpAdapter makeHttpAdapter() => HttpAdapter(client: Client());