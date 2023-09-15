import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sobatgizi/provider/auth_provider.dart';
import 'package:sobatgizi/theme.dart';

class InformationHeader extends StatelessWidget {
  const InformationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Divider(
            color: primaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tinggi Badan",
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              Text(
                  ((authProvider.user?.tinggiBadan != null)
                      ? authProvider.user!.tinggiBadan.toString() + "cm"
                      : "Belum Isi"),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(
            color: primaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Berat Badan",
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              Text(
                  ((authProvider.user?.beratBadan != null)
                      ? authProvider.user!.beratBadan.toString() + "kg"
                      : "Belum Isi"),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(
            color: primaryColor,
          ),


        ],
      ),
    );
  }
}
