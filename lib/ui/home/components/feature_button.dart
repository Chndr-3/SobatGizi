import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        featureButton("assets/images/recomendation.png",
            "Rekomendasi Menu Makanan", () {}),
        featureButton(
            "assets/images/nutrition.png", "Input Kalori Harian", () {}),
        featureButton(
            "assets/images/healthyfood.png", "Daftar Gizi Makanan", () {})
      ]),
    );
  }

  Widget featureButton(String imageAsset, String label, VoidCallback navigate) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imageAsset,
                  scale: 5,
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,

                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                )
              ]),
        ),
      ),
    );
  }
}
