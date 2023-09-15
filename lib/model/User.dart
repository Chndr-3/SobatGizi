class Users {
  int? id;
  String? userId;
  int? tinggiBadan;
  int? beratBadan;
  bool? jenisKelamin;
  int? umur;
  String? jenisAktivitas;
  double? imt;
  double? kaloriKebutuhan;
  double? proteinKebutuhan;
  double? karbohidratKebutuhan;
  double? lemakKebutuhan;

  Users(
      {this.id,
      this.userId,
      this.tinggiBadan,
      this.beratBadan,
      this.jenisKelamin,
      this.umur,
      this.jenisAktivitas,
      this.imt,
      this.kaloriKebutuhan,
      this.proteinKebutuhan,
      this.karbohidratKebutuhan,
      this.lemakKebutuhan});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tinggiBadan = json['tinggi_badan'];
    beratBadan = json['berat_badan'];
    jenisKelamin = json['jenis_kelamin'];
    umur = json['umur'];
    jenisAktivitas = json['jenis_aktivitas'];
    imt = json['imt'];
    kaloriKebutuhan = json['kalori_kebutuhan'];
    proteinKebutuhan = json['protein_kebutuhan'];
    karbohidratKebutuhan = json['karbohidrat_kebutuhan'];
    lemakKebutuhan = json['lemak_kebutuhan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tinggi_badan'] = this.tinggiBadan;
    data['berat_badan'] = this.beratBadan;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['umur'] = this.umur;
    data['jenis_aktivitas'] = this.jenisAktivitas;
    data['imt'] = this.imt;
    data['kalori_kebutuhan'] = this.kaloriKebutuhan;
    return data;
  }
}
