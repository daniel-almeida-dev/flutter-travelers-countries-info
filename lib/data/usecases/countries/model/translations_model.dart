class TranslationsModel {
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? hu;

  TranslationsModel(
      {this.br,
        this.pt,
        this.nl,
        this.hr,
        this.fa,
        this.de,
        this.es,
        this.fr,
        this.ja,
        this.it,
        this.hu});

  TranslationsModel.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    pt = json['pt'];
    nl = json['nl'];
    hr = json['hr'];
    fa = json['fa'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    ja = json['ja'];
    it = json['it'];
    hu = json['hu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['br'] = br;
    data['pt'] = pt;
    data['nl'] = nl;
    data['hr'] = hr;
    data['fa'] = fa;
    data['de'] = de;
    data['es'] = es;
    data['fr'] = fr;
    data['ja'] = ja;
    data['it'] = it;
    data['hu'] = hu;
    return data;
  }
}