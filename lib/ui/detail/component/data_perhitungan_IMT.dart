import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/detail/component/header.dart';

import '../../../provider/auth_provider.dart';

class DataPerhitunganIMT extends StatelessWidget {
  const DataPerhitunganIMT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Nilai IMT",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
                child: Column(
              children: [
                Text(
                  ((authProvider.user?.imt != null)
                      ? authProvider.user!.imt!.toStringAsFixed(1)
                      : "Belum isi"),
                  style: TextStyle(
                      fontSize: 48,
                      color: colorReturn(authProvider.user?.imt ?? 0),
                      fontWeight: FontWeight.bold),
                ),
                (authProvider.user?.imt != null)
                    ? Text(
                        indeksMassaTubuh(authProvider.user?.imt ?? 0),
                        style: TextStyle(
                            fontSize: 20,
                            color: colorReturn(authProvider.user?.imt ?? 0)),
                      )
                    : SizedBox()
              ],
            )),
          ),
          InformationHeader(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Indeks Massa Tubuh : \n\nUkuran yang digunakan untuk mengetahui status gizi seseorang yang didapatkan dari perbandingan berat dan tinggi badan"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Sangat Kurus : < 17\nKurus : 17 - < 18.5\nNormal : 18.5 - 25\nGemuk : > 25 - 27\nObesitas : > 27")
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

indeksMassaTubuh(double indeksMassaTubuh) {
  if (indeksMassaTubuh == 0) {
    return "Belum Input";
  } else if (indeksMassaTubuh < 17) {
    return "Sangat Kurus";
  } else if (indeksMassaTubuh >= 17 && indeksMassaTubuh < 18.5) {
    return "Kurus";
  } else if (indeksMassaTubuh >= 18.5 && indeksMassaTubuh <= 25) {
    return "Normal";
  } else if (indeksMassaTubuh > 25 && indeksMassaTubuh <= 27) {
    return "Gemuk";
  } else {
    return "Obesitas";
  }
}

colorReturn(double indeksMassaTubuh) {
  if (indeksMassaTubuh == 0) {
    return Colors.black;
  } else if (indeksMassaTubuh < 17) {
    return Colors.amber;
  } else if (indeksMassaTubuh >= 17 && indeksMassaTubuh <= 18.5) {
    return Colors.amber;
  } else if (indeksMassaTubuh > 18.5 && indeksMassaTubuh <= 25) {
    return Colors.green;
  } else if (indeksMassaTubuh > 25 && indeksMassaTubuh <= 27) {
    return Colors.amber;
  } else {
    return Colors.red;
  }
}
