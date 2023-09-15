import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sobatgizi/provider/auth_provider.dart';
import 'package:sobatgizi/theme.dart';

class TEEHeader extends StatelessWidget {
  const TEEHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Umur",
                  style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                ),
                Text(
                    ((authProvider.user?.umur != null)
                        ? authProvider.user!.umur.toString() + " tahun"
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
                  "Jenis Kelamin",
                  style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                ),
                Text(((authProvider.user?.jenisKelamin != null)
                    ? (authProvider.user!.jenisKelamin!)
                    ? "Pria"
                    : "Wanita"
                    : "Belum isi"),style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jenis Aktivitas",
                  style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                ),
                Text(
                    ((authProvider.user?.jenisAktivitas != null)
                        ? authProvider.user!.jenisAktivitas.toString()
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
