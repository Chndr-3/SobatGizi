class Bobot {
  int? idBobot;
  String? idPengguna;
  int? bobotKalori;
  int? bobotProtein;
  int? bobotKarbohidrat;
  int? bobotLemak;
  int? jumlahHarian;

  Bobot(
      {this.idBobot,
      this.idPengguna,
      this.bobotKalori,
      this.bobotProtein,
      this.bobotKarbohidrat,
      this.bobotLemak,
      this.jumlahHarian});

  Bobot.fromJson(Map<String, dynamic> json) {
    idBobot = json['id_bobot'];
    idPengguna = json['id_pengguna'];
    bobotKalori = json['bobot_kalori'];
    bobotProtein = json['bobot_protein'];
    bobotKarbohidrat = json['bobot_karbohidrat'];
    bobotLemak = json['bobot_lemak'];
    jumlahHarian = json['jumlah_makan_harian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bobot'] = this.idBobot;
    data['id_pengguna'] = this.idPengguna;
    data['bobot_kalori'] = this.bobotKalori;
    data['bobot_protein'] = this.bobotProtein;
    data['bobot_karbohidrat'] = this.bobotKarbohidrat;
    data['bobot_lemak'] = this.bobotLemak;
    return data;
  }
}
