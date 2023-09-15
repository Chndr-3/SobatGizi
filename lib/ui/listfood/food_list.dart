import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/food_provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/listfood/food_item.dart';
import 'package:provider/provider.dart';

class FoodList extends StatelessWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("List Makanan"),
            centerTitle: true,
            backgroundColor: primaryColor,
          ),
          body: FutureBuilder(
              future:
                  Provider.of<FoodProvider>(context, listen: false).getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount:
                          Provider.of<FoodProvider>(context, listen: false)
                              .listFood!
                              .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FoodItem(
                              food: Provider.of<FoodProvider>(context,
                                      listen: false)
                                  .listFood![index]),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }
              }),
    );
  }
}
