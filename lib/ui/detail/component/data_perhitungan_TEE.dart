import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/detail/component/TEEheader.dart';
import 'package:sobatgizi/ui/detail/component/header.dart';

import '../../../provider/auth_provider.dart';

class DataPerhitunganTee extends StatelessWidget {
  const DataPerhitunganTee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Kebutuhan Kalorimu",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ((authProvider.user?.kaloriKebutuhan != null)
                          ? authProvider.user!.kaloriKebutuhan!.toStringAsFixed(0)
                          : "Belum isi"),
                      style: TextStyle(
                          fontSize: 48,
                          color: (authProvider.user?.kaloriKebutuhan != null)
                              ? primaryColor
                              : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ((authProvider.user?.kaloriKebutuhan != null)
                          ? "kkal"
                          : ""),
                      style: TextStyle(
                          fontSize: 24,
                          color: (authProvider.user?.kaloriKebutuhan != null)
                              ? primaryColor
                              : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
              TEEHeader(),
              Text("Kebutuhan makronutrisi", style: TextStyle(fontSize: 14,),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(

                  decoration: BoxDecoration(border: Border.all(width: 2,color: primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(

                            children: [
                              Text("Protein", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text((authProvider.nutrition.isNotEmpty) ? authProvider.nutrition[0].round().toString() + "gr" : "0",
                                style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          VerticalDivider(color: primaryColor, thickness: 3),
                          Column(
                            children: [
                              Text("Karbohidrat", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(
                                  (authProvider.nutrition.isNotEmpty) ? authProvider.nutrition[1].round().toString() + "gr" : "0",
                                  style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          VerticalDivider(color: primaryColor, thickness: 3),
                          Column(
                            children: [
                              Text("Lemak", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text(

                                 (authProvider.nutrition.isNotEmpty) ? authProvider.nutrition[2].round().toString() + "gr" : "0",
                                  style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          SizedBox(height: 20,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryColor, width: 3),
                    color: primaryColorLowOpacity),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keterangan",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "BMR (Basal Metabolic Rate) : \n\nUkuran yang digunakan untuk mengetahui status gizi seseorang yang didapatkan dari perbandingan berat dan tinggi badan. Rumusnya yaitu:"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Laki - laki"),
                      Text(
                          "88.362 + (13.397 x BB kg) + (4.799 x TB cm) – (5.677 x umur tahun)"),
                      SizedBox(height: 10,),
                      Text("Perempuan"),
                      Text(
                          "447.593 + (9.247 x BB kg) + (3.098 x TB cm) – (4.330 x umur tahun)"),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          "TEE (Total Energy Expenditure) : \n\nUkuran yang digunakan untuk mengetahui status gizi seseorang yang didapatkan dari perbandingan berat dan tinggi badan"),
                      Text("Rumus = BMR * jenis aktivitas"),
                      Text(
                          "\nJenis Aktivitas:\nSangat jarang = 1,2\nJarang = 1.375\nSedang = 1,55\nBerat = 1.725\nSangat Berat = 1,9"),
                      Text("\nNilai TEE inilah yang menjadi nilai kalori harian", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ))),
              SizedBox(height: 30,)


            ],
          ),
        ),
      ),
    );
  }
}
