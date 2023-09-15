import 'package:flutter/material.dart';
import 'package:sobatgizi/model/Food.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/listfood/food_list.dart';
import 'package:sobatgizi/widget_components/elevatedButton.dart';
class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Container(
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
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("List Menu Makanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Expanded(child: CustomButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FoodList(),));}, label: "Makanan",color: primaryColor,)),
                      SizedBox(width: 20,),
                      Expanded(child: CustomButton(onPressed: (){}, label: "Snack", color: primaryColor,),)
                    ],),
                  ),
                ],
              ),

            SizedBox(height: 3,)],
          ),
        ),
      ),
    );
  }
}
