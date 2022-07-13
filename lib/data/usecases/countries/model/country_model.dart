import '../../../../domain/entities/country.dart';
import 'currencies_model.dart';
import 'flags_model.dart';
import 'languages_model.dart';
import 'regional_blocs_model.dart';
import 'translations_model.dart';

class CountryModel {
  String? name;
  List<String> topLevelDomain = [];
  String? alpha2Code;
  String? alpha3Code;
  List<String> callingCodes = [];
  String? capital;
  List<String> altSpellings = [];
  String? subregion;
  String? region;
  int? population;
  List<double> latlng = [];
  String? demonym;
  double? area;
  List<String> timezones = [];
  List<String> borders = [];
  String? nativeName;
  String? numericCode;
  FlagsModel? flags;
  List<CurrenciesModel>? currencies;
  List<LanguagesModel>? languages;
  TranslationsModel? translations;
  String? flag;
  List<RegionalBlocsModel>? regionalBlocs;
  String? cioc;
  bool? independent;

  CountryModel(
      {this.name,
      required this.topLevelDomain,
      this.alpha2Code,
      this.alpha3Code,
      required this.callingCodes,
      this.capital,
      required this.altSpellings,
      this.subregion,
      this.region,
      this.population,
      required this.latlng,
      this.demonym,
      this.area,
      required this.timezones,
      required this.borders,
      this.nativeName,
      this.numericCode,
      this.flags,
      this.currencies,
      this.languages,
      this.translations,
      this.flag,
      this.regionalBlocs,
      this.cioc,
      this.independent});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    topLevelDomain = json['topLevelDomain']?.cast<String>() ?? [];
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    callingCodes = json['callingCodes']?.cast<String>() ?? [];
    capital = json['capital'];
    altSpellings = json['altSpellings']?.cast<String>() ?? [];
    subregion = json['subregion'];
    region = json['region'];
    population = json['population'];
    latlng = json['latlng']?.cast<double>() ?? [];
    demonym = json['demonym'];
    area = json['area'];
    timezones = json['timezones']?.cast<String>() ?? [];
    borders = json['borders']?.cast<String>() ?? [];
    nativeName = json['nativeName'];
    numericCode = json['numericCode'];
    flags = json['flags'] != null ? FlagsModel.fromJson(json['flags']) : null;
    if (json['currencies'] != null) {
      currencies = <CurrenciesModel>[];
      json['currencies'].forEach((v) {
        currencies?.add(CurrenciesModel.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <LanguagesModel>[];
      json['languages'].forEach((v) {
        languages?.add(LanguagesModel.fromJson(v));
      });
    }
    translations = json['translations'] != null
        ? TranslationsModel.fromJson(json['translations'])
        : null;
    flag = json['flag'];
    if (json['regionalBlocs'] != null) {
      regionalBlocs = <RegionalBlocsModel>[];
      json['regionalBlocs'].forEach((v) {
        regionalBlocs?.add(RegionalBlocsModel.fromJson(v));
      });
    }
    cioc = json['cioc'];
    independent = json['independent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['topLevelDomain'] = topLevelDomain;
    data['alpha2Code'] = alpha2Code;
    data['alpha3Code'] = alpha3Code;
    data['callingCodes'] = callingCodes;
    data['capital'] = capital;
    data['altSpellings'] = altSpellings;
    data['subregion'] = subregion;
    data['region'] = region;
    data['population'] = population;
    data['latlng'] = latlng;
    data['demonym'] = demonym;
    data['area'] = area;
    data['timezones'] = timezones;
    data['borders'] = borders;
    data['nativeName'] = nativeName;
    data['numericCode'] = numericCode;
    if (flags != null) {
      data['flags'] = flags?.toJson();
    }
    if (currencies != null) {
      data['currencies'] = currencies?.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages?.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations?.toJson();
    }
    data['flag'] = flag;
    if (regionalBlocs != null) {
      data['regionalBlocs'] = regionalBlocs?.map((v) => v.toJson()).toList();
    }
    data['cioc'] = cioc;
    data['independent'] = independent;
    return data;
  }

  Country toEntity() =>
      Country(name: this.name ?? "", flag: this.flags?.png ?? "", portugueseName: this.translations?.br ?? "");

  Country toEntitySimpleInfo() =>
      Country(name: this.name ?? "", flag: this.flags?.png ?? "", portugueseName: this.translations?.br ?? "");
}
