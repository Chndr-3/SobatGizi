class Result {
  String? alternatif;
  int? idPaketMenu;
  double? vi;
  int? urutan;

  Result({this.alternatif, this.idPaketMenu, this.vi, this.urutan});

  Result.fromJson(Map<String, dynamic> json) {
    alternatif = json['Alternatif'];
    idPaketMenu = json['id_paket_menu'];
    vi = json['Vi'];
    urutan = json['Urutan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Alternatif'] = this.alternatif;
    data['id_paket_menu'] = this.idPaketMenu;
    data['Vi'] = this.vi;
    data['Urutan'] = this.urutan;
    return data;
  }
}