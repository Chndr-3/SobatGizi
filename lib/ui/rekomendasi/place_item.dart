import 'package:flutter/material.dart';
import 'package:sobatgizi/theme.dart';

import '../../../model/Result.dart';
import '../../model/Food.dart';
class PlaceItem extends StatelessWidget {
  const PlaceItem({Key? key, required this.food, required this.index}) : super(key: key);
  final Food food;
  final int index;

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
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),   color: primaryColor,),
              height: double.infinity,
              width: 40,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${index+1}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                  SizedBox(height: 20,),
                  (index >= 0 && index <=4 ) ? Icon(Icons.thumb_up, size: 20,color: Colors.white,) : SizedBox()
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex : 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.menuMakanan!,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Expanded(flex: 2,
                          child: Column(
                            children: [
                              Text(
                                food.energi!.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("kkal")
                            ],
                          ),
                        )
                      ],
                    ),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: primaryColor, width: 2),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child:
                                    Column(
                                      children: [
                                        Text("Protein"),
                                        Text(food.protein!.toStringAsFixed(0) + "gr", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                      ],
                                    )),
                            Expanded(
                                child:
                                Column(
                                  children: [
                                    Text("Fat"),
                                    Text(food.fat!.toStringAsFixed(0) + "gr", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                  ],
                                )),
                            Expanded(
                                child:
                                Column(
                                  children: [
                                    Text("Carbs"),
                                    Text(food.carbohydrate!.toStringAsFixed(0) + "gr", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
