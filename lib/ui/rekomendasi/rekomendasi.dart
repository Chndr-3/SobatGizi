import 'package:flutter/material.dart';
import 'package:sobatgizi/theme.dart';
import 'package:provider/provider.dart';
import 'package:sobatgizi/ui/rekomendasi/place_item.dart';
import '../../provider/food_provider.dart';

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rekomendasi"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder(
          future: Provider.of<FoodProvider>(context, listen: false)
              .getFoodRecommendation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Berikut 5 rekomendasi menu makanan cepat saji terbaik untukmu: ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PlaceItem(
                                index: index,
                                food: Provider.of<FoodProvider>(context,
                                        listen: false)
                                    .listFoodRecommendation![index]),
                          );
                        }),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
          }),
    );
  }
}
