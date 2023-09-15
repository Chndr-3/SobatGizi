import 'package:flutter/foundation.dart';
import 'package:sobatgizi/service/bobot_services.dart';

import '../model/Bobot.dart';

class BobotProvider extends ChangeNotifier {
  List<double> _bobot = [5, 3, 2, 1, 3];

  //Kalori, Protein, Karbohidrat, Lemak
  List<double> get bobot => _bobot;
  List<double> _editBobot = [5,3,2,1,3];

  //Kalori, Protein, Karbohidrat, Lemak
  List<double> get editBobot => _editBobot;
  clear(){
    _bobot = [5, 3, 2, 1, 3];
    notifyListeners();
  }
  setBobot(double nilai, int index) {
    _editBobot[index] = nilai;
    notifyListeners();
  }

  jumlahHarian(bool tambah){
    if(tambah){
      _editBobot[4] += 1;
    } else{
      _editBobot[4] -= 1;
    }
    notifyListeners();
  }

  Future<bool> insertBobot({required int kalori,
    required int protein,
    required int karbohidrat,
    required int lemak,required int jumlahMakan}) async {
    try {
      await BobotServices().insertBobot(kalori: kalori,
          protein: protein,
          karbohidrat: karbohidrat,
          lemak: lemak,jumlahMakan : jumlahMakan);
      _bobot = [
        double.parse(kalori.toString()),
        double.parse(protein.toString()),
        double.parse(karbohidrat.toString()),
        double.parse(lemak.toString()),
        double.parse(jumlahMakan.toString())
      ];
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getBobot() async {
    try {
      Bobot bobot = await BobotServices().getBobot();
      _bobot = [
        double.parse(bobot.bobotKalori.toString()),
        double.parse(bobot.bobotProtein.toString()),
        double.parse(bobot.bobotKarbohidrat.toString()),
        double.parse(bobot.bobotLemak.toString()),
        double.parse(bobot.jumlahHarian.toString())
      ];
      _editBobot = _bobot;
      return true;
    } catch (e) {
      return false;
    }
  }
}
