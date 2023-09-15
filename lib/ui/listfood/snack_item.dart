import 'package:flutter/material.dart';
import 'package:sobatgizi/model/Food.dart';
import 'package:sobatgizi/theme.dart';

import '../../model/Snack.dart';

class SnackItem extends StatelessWidget {
  const SnackItem({Key? key, required this.snack}) : super(key: key);
  final Snack snack;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snack.snack!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),),
                    Text(snack.porsi!.toString() + " gram")
                  ],
                ),
                Column(
                  children: [
                    Text(snack.energi!.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text("Kalori")
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Text("Protein: " + snack.protein!.toString())),
                Expanded(child: Text("Fat: " + snack.fat!.toString())),
                Expanded(
                    child: Text(
                        "Carbohydrate: " + snack.carbohydrate!.toString()))
              ],
            )
          ],
        ),
      ),
    );
  }
}
