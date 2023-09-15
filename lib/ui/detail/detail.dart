import 'package:flutter/material.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/detail/component/data_perhitungan_IMT.dart';
import 'package:sobatgizi/ui/detail/component/data_perhitungan_TEE.dart';
import 'package:sobatgizi/ui/detail/component/header.dart';
import 'package:sobatgizi/ui/detail/component/keterangan.dart';

class DetailInformasi extends StatelessWidget {
  const DetailInformasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Informasi Tubuhmu"),
          centerTitle: true,
          backgroundColor: primaryColor,
          bottom: TabBar(tabs: [
            Tab(
              child: Text('Indeks Massa Tubuh', style: TextStyle(color: Colors.white)),
            ),
            Tab(
              child:
              Text('Kebutuhan Kalori', style: TextStyle(color: Colors.white)),
            ),
          ]),
        ),
        body: TabBarView(children: [
         DataPerhitunganIMT(),
          DataPerhitunganTee(),
        ],)
      ),
    );
  }
}
