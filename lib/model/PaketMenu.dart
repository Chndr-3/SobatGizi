class PaketMenu {
  int? _idMenu;
  String? _sarapanPagi;
  int? _energi;
  String? _snackPagi;
  int? _energi1;
  String? _makanSiang;
  int? _energi2;
  String? _snackSore;
  int? _energi3;
  String? _makanMalam;
  int? _energi4;
  int? _totalEnergi;

  PaketMenu(
      {int? idMenu,
        String? sarapanPagi,
        int? energi,
        String? snackPagi,
        int? energi1,
        String? makanSiang,
        int? energi2,
        String? snackSore,
        int? energi3,
        String? makanMalam,
        int? energi4,
        int? totalEnergi}) {
    if (idMenu != null) {
      this._idMenu = idMenu;
    }
    if (sarapanPagi != null) {
      this._sarapanPagi = sarapanPagi;
    }
    if (energi != null) {
      this._energi = energi;
    }
    if (snackPagi != null) {
      this._snackPagi = snackPagi;
    }
    if (energi1 != null) {
      this._energi1 = energi1;
    }
    if (makanSiang != null) {
      this._makanSiang = makanSiang;
    }
    if (energi2 != null) {
      this._energi2 = energi2;
    }
    if (snackSore != null) {
      this._snackSore = snackSore;
    }
    if (energi3 != null) {
      this._energi3 = energi3;
    }
    if (makanMalam != null) {
      this._makanMalam = makanMalam;
    }
    if (energi4 != null) {
      this._energi4 = energi4;
    }
    if (totalEnergi != null) {
      this._totalEnergi = totalEnergi;
    }
  }

  int? get idMenu => _idMenu;
  set idMenu(int? idMenu) => _idMenu = idMenu;
  String? get sarapanPagi => _sarapanPagi;
  set sarapanPagi(String? sarapanPagi) => _sarapanPagi = sarapanPagi;
  int? get energi => _energi;
  set energi(int? energi) => _energi = energi;
  String? get snackPagi => _snackPagi;
  set snackPagi(String? snackPagi) => _snackPagi = snackPagi;
  int? get energi1 => _energi1;
  set energi1(int? energi1) => _energi1 = energi1;
  String? get makanSiang => _makanSiang;
  set makanSiang(String? makanSiang) => _makanSiang = makanSiang;
  int? get energi2 => _energi2;
  set energi2(int? energi2) => _energi2 = energi2;
  String? get snackSore => _snackSore;
  set snackSore(String? snackSore) => _snackSore = snackSore;
  int? get energi3 => _energi3;
  set energi3(int? energi3) => _energi3 = energi3;
  String? get makanMalam => _makanMalam;
  set makanMalam(String? makanMalam) => _makanMalam = makanMalam;
  int? get energi4 => _energi4;
  set energi4(int? energi4) => _energi4 = energi4;
  int? get totalEnergi => _totalEnergi;
  set totalEnergi(int? totalEnergi) => _totalEnergi = totalEnergi;

  PaketMenu.fromJson(Map<String, dynamic> json) {
    _idMenu = json['id_menu'];
    _sarapanPagi = json['sarapan_pagi'];
    _energi = json['energi'];
    _snackPagi = json['snack_pagi'];
    _energi1 = json['energi_1'];
    _makanSiang = json['makan_siang'];
    _energi2 = json['energi_2'];
    _snackSore = json['snack_sore'];
    _energi3 = json['energi_3'];
    _makanMalam = json['makan_malam'];
    _energi4 = json['energi_4'];
    _totalEnergi = json['total_energi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_menu'] = this._idMenu;
    data['sarapan_pagi'] = this._sarapanPagi;
    data['energi'] = this._energi;
    data['snack_pagi'] = this._snackPagi;
    data['energi_1'] = this._energi1;
    data['makan_siang'] = this._makanSiang;
    data['energi_2'] = this._energi2;
    data['snack_sore'] = this._snackSore;
    data['energi_3'] = this._energi3;
    data['makan_malam'] = this._makanMalam;
    data['energi_4'] = this._energi4;
    data['total_energi'] = this._totalEnergi;
    return data;
  }
}