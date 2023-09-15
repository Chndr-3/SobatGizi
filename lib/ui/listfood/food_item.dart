import 'package:flutter/material.dart';
import 'package:sobatgizi/model/Food.dart';
import 'package:sobatgizi/theme.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({Key? key, required this.food}) : super(key: key);
  final Food food;

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
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.menuMakanan!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(food.energi!.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Text("kkal")
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text("Protein: " + food.protein!.toString())),
                  Expanded(child: Text("Fat: " + food.fat!.toString())),
                  Expanded(
                      child: Text(
                          "Carbohydrate: " + food.carbohydrate!.toString()))
                ],
              )
            ],
          ),
        ),
      );
  }
}
