class FlagsModel {
  String? svg;
  String? png;

  FlagsModel({this.svg, this.png});

  FlagsModel.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
    png = json['png'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    data['png'] = png;
    return data;
  }
}