import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UsersInfo {
  Future setToken(String? value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("token", value!);
  }

  Future setIdUser(String? value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString('idUser', value!);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }
  Future<String?> getIdUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("idUser");
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}
