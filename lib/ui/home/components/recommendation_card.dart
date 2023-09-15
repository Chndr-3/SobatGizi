import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/auth_provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/bobot/bobot_slider.dart';

import 'package:sobatgizi/widget_components/elevatedButton.dart';
import 'package:provider/provider.dart';
import '../../rekomendasi/rekomendasi.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 4),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/recomendation.png",
                scale: 2,
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rekomendasi Makanan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Temukan menu makanan cepat saji terbaik berdasarkan gizimu",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.left,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            if(Provider.of<AuthProvider>(context,listen: false).user?.kaloriKebutuhan != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BobotSlider(),
                                  ));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Anda harus mengisi informasi tubuh anda terlebih dahulu"),
                              ));
                            }
                          },
                          child: Text("Cari"),
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              elevation: 6,
                              shape: StadiumBorder(),
                              minimumSize: Size(100, 30)),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
