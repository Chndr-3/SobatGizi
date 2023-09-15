import 'dart:convert';

import '../credentials/supabase_credentials.dart';
import '../model/Food.dart';
import '../model/Snack.dart';

class FoodServices{
  Future getFoodData() async{
    List<Food> listFood = [];
    final response = await SupabaseCredentials.supabaseClient
        .from('makanan')
        .select();
    if (response[0]['id_makanan'] != null) {
      for (var data in response){
        listFood.add(Food.fromJson(data));
      }
      print(listFood);
      return listFood;
    } else {
      return null;
    }
  }
  Future getSnackData() async{
    List<Snack> listSnack = [];
    final response = await SupabaseCredentials.supabaseClient
        .from('snack_info')
        .select();
    print(response);
    if (response[0]['id_snack'] != null) {
      for (var data in response){
        listSnack.add(Snack.fromJson(data));
      }
      return listSnack;
    } else {
      return null;
    }
  }
}