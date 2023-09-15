import 'package:flutter/material.dart';
import 'package:sobatgizi/model/PaketMenu.dart';
import 'package:sobatgizi/service/food_services.dart';
import 'package:sobatgizi/service/menu_service.dart';
import 'package:sobatgizi/service/recommendation_service.dart';

import '../model/Food.dart';
import '../model/Snack.dart';

class FoodProvider with ChangeNotifier{
  List<Food>? _listFood;
  List<Food>? get listFood => _listFood;

  List<Food>? _listFoodRecommendation;
  List<Food>? get listFoodRecommendation => _listFoodRecommendation;

  clear(){
    _listFoodRecommendation = [];
    notifyListeners();
  }


  Future<bool> getData() async {
    try {
      _listFood =  await FoodServices().getFoodData();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }


  Future<bool> getFoodRecommendation() async{
    try{
      _listFoodRecommendation = await RecommendationServices().getFoodList();
      notifyListeners();
      return true;
    } catch(e){
      return false;
    }
  }

}