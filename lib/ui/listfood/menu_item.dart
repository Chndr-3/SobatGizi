import 'package:flutter/material.dart';
import 'package:sobatgizi/model/PaketMenu.dart';
import 'package:sobatgizi/theme.dart';
class PaketMenuItem extends StatelessWidget {
  const PaketMenuItem({Key? key, required this.menu}) : super(key: key);
  final PaketMenu menu;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
                    Text("Paket Menu " + menu.idMenu.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),),
                    Text("Makan siang:\n" + menu.makanSiang!.toString() + " gram", overflow: TextOverflow.ellipsis),
                    Text("Makan malam:\n" + menu.makanMalam!.toString() + " gram")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
