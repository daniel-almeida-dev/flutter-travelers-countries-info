class CurrenciesModel {
  String? code;
  String? name;
  String? symbol;

  CurrenciesModel({this.code, this.name, this.symbol});

  CurrenciesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}