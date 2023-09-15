import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/auth_provider.dart';
import 'package:sobatgizi/provider/bobot_provider.dart';
import 'package:sobatgizi/provider/edit_provider.dart';
import 'package:sobatgizi/provider/food_provider.dart';
import 'package:sobatgizi/ui/home/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => EditProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FoodProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BobotProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: HomeScreen(),
        ));
  }
}
