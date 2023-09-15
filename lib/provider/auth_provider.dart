import 'package:sobatgizi/service/user_service.dart';

import '../model/User.dart';
import '../service/auth_service.dart';
import 'package:flutter/material.dart';

enum EditLoading { Loading, Success }

class AuthProvider with ChangeNotifier {

  EditLoading _editLoading = EditLoading.Success;

  EditLoading get editLoading => _editLoading;
  Users? _user;

  Users? get user => _user;
  List<double> _nutrition = [];

  List<double> get nutrition => _nutrition;

  clear(){
    _user = Users();
    _nutrition = [];
    notifyListeners();
  }

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      await AuthService().register(
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      print("EXception: $e");
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      print("EXception: $e");
      return false;
    }
  }

  Future getUser({
    required String id,
  }) async {
    try {
      Users response = await UserService().getUserData(userId: id);
      // calorieEquation();
      _user = response;
      print(_user);
      var protein = ((15 / 100) * (_user!.kaloriKebutuhan!)) / 4;
      var karbohidrat = ((60 / 100) * (_user!.kaloriKebutuhan!)) / 4;
      var lemak = ((25 / 100) * (_user!.kaloriKebutuhan!)) / 9;
      _nutrition = [protein, karbohidrat, lemak];
      notifyListeners();
    } catch (e) {
      _user = Users();
      _nutrition = [0,0,0];
      print("EXception get: $e");
    }
  }

  Future<bool> edit({
    required int tinggiBadan,
    required int beratBadan,
    required int umur,
    required bool jenisKelamin,
    required String jenisAktivitas,
    required double imt,
    required double kalori,
    required double protein,
    required double karbohidrat,
    required double lemak
  }) async {
    try {
      _editLoading = EditLoading.Loading;
      notifyListeners();
      await UserService().insertUserData(
          tinggiBadan: tinggiBadan,
          beratBadan: beratBadan,
          umur: umur,
          jenisKelamin: jenisKelamin,
          jenisAktivitas: jenisAktivitas,
          imt: imt,
          kalori: kalori,
          protein: protein,
          karbohidrat: karbohidrat,
          lemak: lemak);
      _editLoading = EditLoading.Success;
      notifyListeners();

      return true;
    } catch (e) {
      print("EXception edit: $e");
      return false;
    }
  }
}
