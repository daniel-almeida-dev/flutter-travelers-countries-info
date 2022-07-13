class RegionalBlocsModel {
  String? acronym;
  String? name;

  RegionalBlocsModel({this.acronym, this.name});

  RegionalBlocsModel.fromJson(Map<String, dynamic> json) {
    acronym = json['acronym'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acronym'] = acronym;
    data['name'] = name;
    return data;
  }
}