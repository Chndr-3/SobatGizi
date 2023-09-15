import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/bobot_provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:provider/provider.dart';
import 'package:sobatgizi/ui/bobot/bobot_edit_slider.dart';
import 'package:sobatgizi/ui/rekomendasi/rekomendasi.dart';
import '../../service/recommendation_service.dart';

class BobotSlider extends StatelessWidget {
  const BobotSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0), () {
      Provider.of<BobotProvider>(context, listen: false).getBobot();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferensi Bobot"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(18),
        child: FutureBuilder(
            future:
                Provider.of<BobotProvider>(context, listen: false).getBobot(),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Preferensi Bobot Gizimu Sekarang",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Consumer<BobotProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Text("Kecocokan Kalori " + scaling(value.bobot[0])),
                          Slider(
                              activeColor: primaryColor,
                              value: value.bobot[0],
                              max: 5,
                              min: 1,
                              divisions: 4,
                              label: value.bobot[0].round().toString(),
                              onChanged: null),
                        ],
                      );
                    },
                  ),
                  Consumer<BobotProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Text("Kecocokan Protein " + scaling(value.bobot[1])),
                          Slider(
                              activeColor: primaryColor,
                              value: value.bobot[1],
                              max: 5,
                              min: 1,
                              divisions: 4,
                              label: value.bobot[1].round().toString(),
                              onChanged: null),
                        ],
                      );
                    },
                  ),
                  Consumer<BobotProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Text("Kecocokan Karbohidrat " +
                              scaling(value.bobot[2])),
                          Slider(
                              activeColor: primaryColor,
                              value: value.bobot[2],
                              max: 5,
                              min: 1,
                              divisions: 4,
                              label: value.bobot[2].round().toString(),
                              onChanged: null),
                        ],
                      );
                    },
                  ),
                  Consumer<BobotProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Text("Kecocokan Lemak " + scaling(value.bobot[3])),
                          Slider(
                              activeColor: primaryColor,
                              value: value.bobot[3],
                              max: 5,
                              min: 1,
                              divisions: 4,
                              label: value.bobot[3].round().toString(),
                              onChanged: null),
                        ],
                      );
                    },
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BobotEditSlider(),
                              ));
                        },
                        child: Text(
                          "Edit Preferensi",
                          style: TextStyle(color: primaryColor),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<BobotProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor),
                              onPressed: () async {
                                Future.delayed(
                                  Duration(seconds: 3),
                                  () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Rekomendasi()));
                                  },
                                );

                                await RecommendationServices()
                                    .insertFoodRecommendation(
                                        bobotKalori: value.bobot[0],
                                        bobotProtein: value.bobot[1],
                                        bobotKarbohidrat: value.bobot[2],
                                        bobotLemak: value.bobot[3],
                                        jumlahMakanHarian: value.bobot[4]);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Sedang Mengkalkulasi"),
                                ));
                              },
                              child: Text("Cari Rekomendasi Makanan")),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Hasil rekomendasi berdasarkan ${int.parse(value.bobot[4].toStringAsFixed(0))}x makan sehari",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      );
                    },
                  ),
                ],
              );
            }),
      )),
    );
  }
}

scaling(double preferensi) {
  if (preferensi == 1) {
    return "Sangat Rendah";
  } else if (preferensi == 2) {
    return "Rendah";
  } else if (preferensi == 3) {
    return "Normal";
  } else if (preferensi == 4) {
    return "Tinggi";
  } else if (preferensi == 5) {
    return "Sangat Tinggi";
  }
}
