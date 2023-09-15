class Snack {
  int? idSnack;
  String? snack;
  int? porsi;
  double? energi;
  double? protein;
  double? fat;
  double? carbohydrate;

  Snack(
      {this.idSnack,
        this.snack,
        this.porsi,
        this.energi,
        this.protein,
        this.fat,
        this.carbohydrate});

  Snack.fromJson(Map<String, dynamic> json) {
    idSnack = json['id_snack'];
    snack = json['snack'];
    porsi = json['porsi'];
    energi = json['energy'].toDouble();
    protein = json['protein'].toDouble();
    fat = json['fat'].toDouble();
    carbohydrate = json['carbohydrate'].toDouble();
  }

}