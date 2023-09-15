import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sobatgizi/credentials/supabase_credentials.dart';

import '../helper/user_info.dart';
import '../model/User.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<bool> insertUserData(
      {required int tinggiBadan,
      required int beratBadan,
      required int umur,
      required bool jenisKelamin,
      required String jenisAktivitas,
      required double imt,
      required double kalori,
      required double protein,
      required double karbohidrat,
      required double lemak}) async {
    String? userId = await UsersInfo().getIdUser();
    final getResponse = await SupabaseCredentials.supabaseClient
        .from('informasi_pengguna')
        .select()
        .eq("user_id", userId);
    if (getResponse.length == 0) {
      final response =
          await SupabaseCredentials.supabaseClient.from('informasi_pengguna').insert({
        'user_id': userId,
        'tinggi_badan': tinggiBadan,
        'berat_badan': beratBadan,
        'umur': umur,
        'jenis_kelamin': jenisKelamin,
        'jenis_aktivitas': jenisAktivitas,
        'imt': imt,
        'kalori_kebutuhan': kalori,
        'protein_kebutuhan': protein,
        'karbohidrat_kebutuhan': karbohidrat,
        'lemak_kebutuhan': lemak,
      }).execute();

      if (response.status == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      final editResponse = await SupabaseCredentials.supabaseClient
          .from('informasi_pengguna')
          .update({
            'tinggi_badan': tinggiBadan,
            'berat_badan': beratBadan,
            'umur': umur,
            'jenis_kelamin': jenisKelamin,
            'jenis_aktivitas': jenisAktivitas,
            'imt': imt,
            'kalori_kebutuhan': kalori,
            'protein_kebutuhan': protein,
            'karbohidrat_kebutuhan': karbohidrat,
            'lemak_kebutuhan': lemak,
          })
          .eq("user_id", userId)
          .execute();
      if (editResponse.status == 201) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future getUserData({required String userId}) async {
    final response = await SupabaseCredentials.supabaseClient
        .from('informasi_pengguna')
        .select()
        .eq("user_id", userId);
    if (response[0]['id'] != null) {
      return Users.fromJson(response[0]);
    } else {
      return null;
    }
  }

// Future uploadImage({required XFile file}) async {
//   String? token = await UsersInfo().getIdUser();
//   final res = SupabaseCredentials.supabaseClient.storage
//       .from('face')
//       .getPublicUrl('images/$token.png');
//   var result = await http.get(Uri.parse(res));
//
//   if (result.body.toString().length > 100) {
//     await SupabaseCredentials.supabaseClient.storage.from('face').update(
//           'images/$token.png',
//           File(file.path),
//         );
//     final finalUrl = SupabaseCredentials.supabaseClient.storage
//         .from('face')
//         .getPublicUrl('images/$token.png');
//     return finalUrl;
//   }
//
//   if (jsonDecode(result.body)["error"] == "Not found") {
//     await SupabaseCredentials.supabaseClient.storage.from('face').upload(
//           'images/$token.png',
//           File(file.path),
//         );
//   }
//
//   final finalUrl = SupabaseCredentials.supabaseClient.storage
//       .from('face')
//       .getPublicUrl('images/$token.png');
//   return finalUrl;
// }
}
