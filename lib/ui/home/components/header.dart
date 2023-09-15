import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/auth_provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/detail/detail.dart';
import 'package:sobatgizi/ui/edit/edit.dart';
import 'package:provider/provider.dart';
import '../../../model/User.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key, this.user}) : super(key: key);
  final Users? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<AuthProvider>(
                    builder: (context, value, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextHeader(
                              "Tinggi Badan(cm)",
                              ((value.user?.tinggiBadan != null)
                                  ? value.user!.tinggiBadan.toString()
                                  : "Belum Isi")),
                          customTextHeader(
                              "Berat Badan(kg)",
                              ((value.user?.beratBadan != null)
                                  ? value.user!.beratBadan.toString()
                                  : "Belum Isi")),
                          customTextHeader(
                              "Umur",
                              ((value.user?.umur != null)
                                  ? value.user!.umur.toString()
                                  : "Belum Isi")),
                          customTextHeader(
                              "Jenis Kelamin",
                              (value.user?.jenisKelamin != null)
                                  ? (value.user!.jenisKelamin!)
                                      ? "Pria"
                                      : "Wanita"
                                  : "Belum isi"),
                          customTextHeader("Jenis Aktivitas",
                              value.user?.jenisAktivitas ?? "Belum isi"),
                        ],
                      );
                    },
                  ),
                  Consumer<AuthProvider>(
                    builder: (context, value, child) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Nilai Indeks Massa Tubuh",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  (value.user?.imt == null)
                                      ? "0"
                                      : value.user!.imt!.toStringAsFixed(1),
                                  style: TextStyle(
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Kebutuhan Kalori Harianmu:",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  (value.user?.kaloriKebutuhan == null)
                                      ? "0"
                                      : value.user!.kaloriKebutuhan!
                                          .toStringAsFixed(0),
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                )
                              ],
                            ),
                          ]);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: primaryColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(),
                        ));
                  },
                  child: Text("Kalkulasi IMT & Kebutuhan Kalori Harian")),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailInformasi(),
                          ));
                    },
                    child: Text(
                      "Lihat Detail >",
                      style: TextStyle(color: primaryColor),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customTextHeader(String label, String? nilai) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 10,
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
      SizedBox(
        height: 3,
      ),
      Text(nilai ?? "",
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black)),
      SizedBox(
        height: 15,
      )
    ],
  );
}
