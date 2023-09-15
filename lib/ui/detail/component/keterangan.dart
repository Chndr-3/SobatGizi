import 'package:flutter/material.dart';

class Keterangan extends StatelessWidget {
  const Keterangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Keterangan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        SizedBox(height: 10,),
        Text("Indeks Massa Tubuh : \n\nUkuran yang digunakan untuk mengetahui status gizi seseorang yang didapatkan dari perbandingan berat dan tinggi badan"),
        SizedBox(height: 10,),
        Text("BMR (Basal Metabolic Rate) : \n\nUkuran yang digunakan untuk mengetahui status gizi seseorang yang didapatkan dari perbandingan berat dan tinggi badan"),
        SizedBox(height: 10,),
        Text("TEE (Total Energy Expenditure) : \n\nUkuran yang digunakan untuk mengetahui status gizi seseorang yang didapatkan dari perbandingan berat dan tinggi badan"),


      ],
    );
  }
}
