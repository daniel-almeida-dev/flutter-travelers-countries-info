class LanguagesModel {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  LanguagesModel({this.iso6391, this.iso6392, this.name, this.nativeName});

  LanguagesModel.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso639_1'];
    iso6392 = json['iso639_2'];
    name = json['name'];
    nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso639_1'] = iso6391;
    data['iso639_2'] = iso6392;
    data['name'] = name;
    data['nativeName'] = nativeName;
    return data;
  }
}