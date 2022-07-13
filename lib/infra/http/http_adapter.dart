import 'dart:convert';

import 'package:http/http.dart';
import '../../data/http/http_client.dart';
import '../../data/http/http_error.dart';

class HttpAdapter extends HttpClient {
  HttpAdapter({required this.client});

  final Client client;

  @override
  Future<List<dynamic>?> get({required String url}) async {
    try {
      final uri = Uri.parse(url);

      var response = await client.get(uri).timeout(const Duration(seconds: 20),
          onTimeout: () {
        throw HttpError.timeOut;
      });

      switch (response.statusCode) {
        case 200:
          return response.body.isNotEmpty ? json.decode(utf8.decode(response.bodyBytes)) : null;
        case 400:
          throw HttpError.badRequest;
        case 403:
          throw HttpError.forbidden;
        case 404:
          throw HttpError.notFound;
        case 500:
          throw HttpError.serverError;
        default:
          throw HttpError.notMapped;
      }
    } catch (error) {
      throw HttpError.serverError;
    }
  }

}
