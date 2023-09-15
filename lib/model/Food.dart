class FoodRecommendation {
  int? idMakanan;
  Food? foodInfo;

  FoodRecommendation({
    required this.idMakanan,
    required this.foodInfo,
  });
  FoodRecommendation.fromJson(Map<String, dynamic> json) {
    idMakanan = json['id_makanan'];
    foodInfo = json['makanan'];
  }
}

class Food {
  int? idMakanan;
  String? menuMakanan;
  int? porsi;
  double? energi;
  double? protein;
  double? fat;
  double? carbohydrate;

  Food(
      {this.idMakanan,
        this.menuMakanan,
        this.porsi,
        this.energi,
        this.protein,
        this.fat,
        this.carbohydrate});

  Food.fromJson(Map<String, dynamic> json) {
    idMakanan = json['id_makanan'];
    menuMakanan = json['menu_makanan'];
    energi = json['energy'].toDouble();
    protein = json['protein'].toDouble();
    fat = json['fat'].toDouble();
    carbohydrate = json['carbohydrate'].toDouble();
  }

}

