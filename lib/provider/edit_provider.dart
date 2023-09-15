import 'package:flutter/material.dart';
import 'package:sobatgizi/ui/edit/edit.dart';


class EditProvider with ChangeNotifier {
  JenisKelamin _jenisKelamin = JenisKelamin.pria;
  JenisKelamin get jenisKelamin => _jenisKelamin;
  String _jenisAktivitas = "Ringan";
  String get jenisAktivitas => _jenisAktivitas;

  String? _tinggiBadan;
  String? get tinggiBadan => _tinggiBadan;
  String? _beratBadan;
  String? get beratBadan => _beratBadan;
  String? _umur;
  String? get umur => _umur;

  void setJenisKelamin(JenisKelamin jk) {
    _jenisKelamin = jk;
    notifyListeners();
  }


  void setJenisAktivitas(String ja) {
    _jenisAktivitas = ja;
    notifyListeners();
  }

  void setTinggiBadan(String? tinggiBadan){
    _tinggiBadan = tinggiBadan;
    notifyListeners();
  }
  void setBeratBadan(String? beratBadan){
    _beratBadan = beratBadan;
    notifyListeners();
  }
  void setUmur(String? umur){
    _umur = umur;
    notifyListeners();
  }

  void reset(){
    _umur = "";
    _beratBadan = "";
    _tinggiBadan = "";
    notifyListeners();
  }
}
