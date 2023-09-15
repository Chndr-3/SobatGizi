import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/bobot_provider.dart';
import 'package:sobatgizi/provider/edit_provider.dart';
import 'package:sobatgizi/provider/food_provider.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/home/components/header.dart';
import 'package:sobatgizi/ui/home/components/recommendation_card.dart';
import 'package:sobatgizi/ui/listfood/food_list.dart';
import 'package:sobatgizi/ui/login/login.dart';
import '../../helper/user_info.dart';
import 'package:provider/provider.dart';
import '../../model/User.dart';
import '../../provider/auth_provider.dart';
import 'components/welcome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.user}) : super(key: key);
  final Users? user;

  @override
  Widget build(BuildContext context) {
    UsersInfo().getIdUser().then((value) {
      if (value == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
      }
    });
    Future.delayed(Duration(seconds: 0), () async {
      await UsersInfo().getIdUser().then((value) {
        Provider.of<AuthProvider>(context, listen: false).getUser(id: value!);
      });
    });
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        WelcomeWidget(),
        Column(
          children: [
            SizedBox(
              height: 25,
            ),

            Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout'),
                        content: Text('Apakah Anda yakin ingin logout?'),
                        actions: [
                          ElevatedButton(
                            child: Text('Batal'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: primaryColor),
                          ),
                          ElevatedButton(
                            child: Text('Logout'),
                            onPressed: () async {
                              // Tambahkan logika logout di sini
                              Provider.of<AuthProvider>(context, listen: false)
                                  .clear();
                              Provider.of<EditProvider>(context, listen: false)
                                  .reset();
                              Provider.of<BobotProvider>(context, listen: false)
                                  .clear();
                              Provider.of<FoodProvider>(context, listen: false)
                                  .clear();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (Route route) => false);
                              await UsersInfo().logout();
                            },
                            style:
                                ElevatedButton.styleFrom(primary: primaryColor),
                          ),
                        ],
                      );
                    },
                  );
                },
                label: Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: HomeHeader(
                user: Provider.of<AuthProvider>(context, listen: false).user,
              ),
            ),
            // FoodMenu(),
            RecommendationCard(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ingin lihat menu makanan yang tersedia?"),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodList(),
                        )),
                    child: Text(
                      "KLIK DISINI",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ))
              ],
            )
          ],
        ),
      ]),
    ));
  }
}
