import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_final_flutter/data/http/http_client.dart';
import 'package:projeto_final_flutter/data/http/http_error.dart';
import 'package:projeto_final_flutter/data/usecases/countries/service/remote_fetch_all_countries.dart';
import 'package:projeto_final_flutter/domain/exceptions/unexpected_exception.dart';

class HttpClientMock extends Mock implements HttpClient {
  HttpClientMock() {
    mockGet(_getResponseJson());
  }

  void mockGet(List<dynamic>? response) =>
      when(() => get(url: "https://restcountries.com/v2/all"))
          .thenAnswer((_) async => response);

  void mockGetError(HttpError error) => when(() => get(
        url: "https://restcountries.com/v2/all",
      )).thenThrow(error);
}

void main() {
  late RemoteFetchAllCountries sut;
  late HttpClientMock httpClient;

  setUp(() {
    httpClient = HttpClientMock();
    sut = RemoteFetchAllCountries(httpClient: httpClient);
  });

  test('Should call httpClient get with correct values', () async {
    await sut.execute();

    verify(() => httpClient.get(url: "https://restcountries.com/v2/all"));
  });

  test('Should return UnexpectedException if client return any HttpError', () async {
    httpClient.mockGetError(HttpError.serverError);

    final future = sut.execute();

    expect(future, throwsA(UnexpectedException()));
  });

  test('Should return countries list name if client returns correct json', () async {
    final response = await sut.execute();

    expect(response[0].name, _getResponseJson()[0]['name']);
    expect(response[1].name, _getResponseJson()[1]['name']);
    expect(response[2].name, _getResponseJson()[2]['name']);
  });

  test('Should return empty array if client returns null', () async {
    httpClient.mockGet(null);

    final response = await sut.execute();

    expect(response, []);
  });
}

List<dynamic> _getResponseJson() => [
      {
        "name": "Afghanistan",
        "topLevelDomain": [".af"],
        "alpha2Code": "AF",
        "alpha3Code": "AFG",
        "callingCodes": ["93"],
        "capital": "Kabul",
        "altSpellings": ["AF", "Af????nist??n"],
        "subregion": "Southern Asia",
        "region": "Asia",
        "population": 40218234,
        "latlng": [33.0, 65.0],
        "demonym": "Afghan",
        "area": 652230.0,
        "timezones": ["UTC+04:30"],
        "borders": ["IRN", "PAK", "TKM", "UZB", "TJK", "CHN"],
        "nativeName": "??????????????????",
        "numericCode": "004",
        "flags": {
          "svg":
              "https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg",
          "png":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png"
        },
        "currencies": [
          {"code": "AFN", "name": "Afghan afghani", "symbol": "??"}
        ],
        "languages": [
          {
            "iso639_1": "ps",
            "iso639_2": "pus",
            "name": "Pashto",
            "nativeName": "????????"
          },
          {
            "iso639_1": "uz",
            "iso639_2": "uzb",
            "name": "Uzbek",
            "nativeName": "O??zbek"
          },
          {
            "iso639_1": "tk",
            "iso639_2": "tuk",
            "name": "Turkmen",
            "nativeName": "T??rkmen"
          }
        ],
        "translations": {
          "br": "Afeganist??o",
          "pt": "Afeganist??o",
          "nl": "Afghanistan",
          "hr": "Afganistan",
          "fa": "??????????????????",
          "de": "Afghanistan",
          "es": "Afganist??n",
          "fr": "Afghanistan",
          "ja": "?????????????????????",
          "it": "Afghanistan",
          "hu": "Afganiszt??n"
        },
        "flag":
            "https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg",
        "regionalBlocs": [
          {
            "acronym": "SAARC",
            "name": "South Asian Association for Regional Cooperation"
          }
        ],
        "cioc": "AFG",
        "independent": true
      },
      {
        "name": "??land Islands",
        "topLevelDomain": [".ax"],
        "alpha2Code": "AX",
        "alpha3Code": "ALA",
        "callingCodes": ["358"],
        "capital": "Mariehamn",
        "altSpellings": ["AX", "Aaland", "Aland", "Ahvenanmaa"],
        "subregion": "Northern Europe",
        "region": "Europe",
        "population": 28875,
        "latlng": [60.116667, 19.9],
        "demonym": "??landish",
        "area": 1580.0,
        "timezones": ["UTC+02:00"],
        "nativeName": "??land",
        "numericCode": "248",
        "flags": {
          "svg": "https://flagcdn.com/ax.svg",
          "png": "https://flagcdn.com/w320/ax.png"
        },
        "currencies": [
          {"code": "EUR", "name": "Euro", "symbol": "???"}
        ],
        "languages": [
          {
            "iso639_1": "sv",
            "iso639_2": "swe",
            "name": "Swedish",
            "nativeName": "svenska"
          }
        ],
        "translations": {
          "br": "Ilhas de Aland",
          "pt": "Ilhas de Aland",
          "nl": "??landeilanden",
          "hr": "??landski otoci",
          "fa": "?????????? ????????",
          "de": "??land",
          "es": "Alandia",
          "fr": "??land",
          "ja": "?????????????????????",
          "it": "Isole Aland",
          "hu": "??land-szigetek"
        },
        "flag": "https://flagcdn.com/ax.svg",
        "regionalBlocs": [
          {"acronym": "EU", "name": "European Union"}
        ],
        "independent": false
      },
      {
        "name": "Albania",
        "topLevelDomain": [".al"],
        "alpha2Code": "AL",
        "alpha3Code": "ALB",
        "callingCodes": ["355"],
        "capital": "Tirana",
        "altSpellings": ["AL", "Shqip??ri", "Shqip??ria", "Shqipnia"],
        "subregion": "Southern Europe",
        "region": "Europe",
        "population": 2837743,
        "latlng": [41.0, 20.0],
        "demonym": "Albanian",
        "area": 28748.0,
        "gini": 33.2,
        "timezones": ["UTC+01:00"],
        "borders": ["MNE", "GRC", "MKD", "UNK"],
        "nativeName": "Shqip??ria",
        "numericCode": "008",
        "flags": {
          "svg": "https://flagcdn.com/al.svg",
          "png": "https://flagcdn.com/w320/al.png"
        },
        "currencies": [
          {"code": "ALL", "name": "Albanian lek", "symbol": "L"}
        ],
        "languages": [
          {
            "iso639_1": "sq",
            "iso639_2": "sqi",
            "name": "Albanian",
            "nativeName": "Shqip"
          }
        ],
        "translations": {
          "br": "Alb??nia",
          "pt": "Alb??nia",
          "nl": "Albani??",
          "hr": "Albanija",
          "fa": "????????????",
          "de": "Albanien",
          "es": "Albania",
          "fr": "Albanie",
          "ja": "???????????????",
          "it": "Albania",
          "hu": "Alb??nia"
        },
        "flag": "https://flagcdn.com/al.svg",
        "regionalBlocs": [
          {"acronym": "CEFTA", "name": "Central European Free Trade Agreement"}
        ],
        "cioc": "ALB",
        "independent": true
      }
    ];
