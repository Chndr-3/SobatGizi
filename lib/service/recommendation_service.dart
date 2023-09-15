import 'dart:convert';

import 'package:sobatgizi/service/food_services.dart';
import 'package:sobatgizi/service/user_service.dart';

import '../credentials/supabase_credentials.dart';
import '../helper/user_info.dart';
import '../model/Food.dart';
import '../model/User.dart';
import '../model/WSM.dart';

class RecommendationServices {
  Future<List<Food>> insertFoodRecommendation(
      {required double bobotKalori,
      required double bobotProtein,
      required double bobotKarbohidrat,
      required double bobotLemak,required double jumlahMakanHarian}) async {
    List<Food> foodList = await FoodServices().getFoodData();
    String? userId = await UsersInfo().getIdUser();
    Users user = await UserService().getUserData(userId: userId!);
    var jumlahSemuaBobot =
        bobotKalori + bobotLemak + bobotProtein + bobotKarbohidrat;

    var normalisasiKalori = bobotKalori / jumlahSemuaBobot,
        normalisasiProtein = bobotProtein / jumlahSemuaBobot,
        normalisasiKarbohidrat = bobotKarbohidrat / jumlahSemuaBobot,
        normalisasiLemak = bobotLemak / jumlahSemuaBobot;
    print(normalisasiKalori);
    print(normalisasiKarbohidrat);
    print(normalisasiLemak);
    var result = [];
    var selisih = <Map>[];
    double jumlahSelisihEnergi = 0,
        jumlahSelisihProtein = 0,
        jumlahSelisihKarbohidrat = 0,
        jumlahSelisihLemak = 0;
    print(user.lemakKebutuhan!.ceil()  / jumlahMakanHarian);
    for (var data in foodList) {
      var map = {};

      var energi = (data.energi! - (user.kaloriKebutuhan!.ceil() / jumlahMakanHarian)).abs();
      var protein = (data.protein!- (user.proteinKebutuhan!.ceil()  / jumlahMakanHarian)).abs();
      var carbohydrate =
          (data.carbohydrate! - (user.karbohidratKebutuhan!.ceil() ) / jumlahMakanHarian).abs();
      var fat = (data.fat! - (user.lemakKebutuhan!.ceil() ) / jumlahMakanHarian).abs();
      map['id_makanan'] = data.idMakanan;
      map['selisih_energi'] = energi;
      map['selisih_protein'] = protein;
      map['selisih_karbohidrat'] = carbohydrate;
      map['selisih_lemak'] = fat;
      jumlahSelisihEnergi =
          jumlahSelisihEnergi + energi;
      jumlahSelisihProtein =
          jumlahSelisihProtein + protein;
      jumlahSelisihKarbohidrat =
          jumlahSelisihKarbohidrat + carbohydrate;
      jumlahSelisihLemak =
          jumlahSelisihLemak + fat;
      selisih.add(map);
      print(jumlahSelisihKarbohidrat);
    }
    for (var data in selisih) {
      var performaKalori = double.parse(
          ((1 - (data['selisih_energi'] / jumlahSelisihEnergi)) * 100)
              .toStringAsFixed(8));
      var performaProtein = double.parse(
          ((1 - (data['selisih_protein'] / jumlahSelisihProtein)) * 100)
              .toStringAsFixed(8));
      var performaKarbohidrat = double.parse(
          ((1 - (data['selisih_karbohidrat'] / jumlahSelisihKarbohidrat)) * 100)
              .toStringAsFixed(8));
      var performaLemak = double.parse(
          ((1 - (data['selisih_lemak'] / jumlahSelisihLemak)) * 100)
              .toStringAsFixed(8));
      result.add(WSM(
              idPengguna: userId,
              idMakanan: data['id_makanan'],
              performaKalori: performaKalori,
              performaProtein: performaProtein,
              performaKarbohidrat: performaKarbohidrat,
              performaLemak: performaLemak,
              hasilWsm: ((normalisasiKalori * performaKalori) +
                  (normalisasiProtein * performaProtein) +
                  (normalisasiKarbohidrat * performaKarbohidrat) +
                  (normalisasiLemak * performaLemak)))
          .toJson());
    }
    final getResponse = await SupabaseCredentials.supabaseClient
        .from('kalkulasi_wsm')
        .select()
        .eq("id_pengguna", userId);
    if (getResponse.length == 0) {
      await SupabaseCredentials.supabaseClient
          .from("kalkulasi_wsm")
          .insert(result)
          .execute();
    } else {
      var iteration = 0;
      for (var data in getResponse) {
        if (iteration < getResponse.length) {
          result[iteration]['id'] = data['id'];

          iteration++;
        } else {
          break;
        }
      }

      await SupabaseCredentials.supabaseClient
          .from("kalkulasi_wsm")
          .upsert(result, onConflict: 'id');
    }

    return foodList;
  }

  Future getFoodList() async {
    String? userId = await UsersInfo().getIdUser();
    List<Food> listFoodRecommended = [];

       final getResponse = await SupabaseCredentials.supabaseClient
          .from('kalkulasi_wsm')
          .select('id_makanan, makanan(*)')
          .eq("id_pengguna", userId)
          .order("hasil_wsm");

    if (getResponse[0]['id_makanan'] != null) {
      for (var i = 0; i < getResponse.length; i++) {
        listFoodRecommended.add(Food.fromJson(getResponse[i]['makanan']));
      }

      return listFoodRecommended;
    }


    return Food();
  }
}
