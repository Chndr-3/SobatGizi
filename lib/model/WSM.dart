class WSM {
  int? id;
  String? idPengguna;
  int? idMakanan;
  double? performaKalori;
  double? performaProtein;
  double? performaKarbohidrat;
  double? performaLemak;
  double? hasilWsm;

  WSM(
      {this.id,
        this.idPengguna,
        this.idMakanan,
        this.performaKalori,
        this.performaProtein,
        this.performaKarbohidrat,
        this.performaLemak,
        this.hasilWsm});

  WSM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPengguna = json['id_pengguna'];
    idMakanan = json['id_makanan'];
    performaKalori = json['performa_kalori'];
    performaProtein = json['performa_protein'];
    performaKarbohidrat = json['performa_karbohidrat'];
    performaLemak = json['performa_lemak'];
    hasilWsm = json['hasil_wsm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengguna'] = this.idPengguna;
    data['id_makanan'] = this.idMakanan;
    data['performa_kalori'] = this.performaKalori;
    data['performa_protein'] = this.performaProtein;
    data['performa_karbohidrat'] = this.performaKarbohidrat;
    data['performa_lemak'] = this.performaLemak;
    data['hasil_wsm'] = this.hasilWsm;
    return data;
  }
}