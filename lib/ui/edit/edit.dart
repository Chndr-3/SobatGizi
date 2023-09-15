import 'package:flutter/material.dart';
import 'package:sobatgizi/provider/edit_provider.dart';
import 'package:sobatgizi/service/user_service.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/widget_components/elevatedButton.dart';
import 'package:sobatgizi/widget_components/textField.dart';
import 'dart:io';
import '../../model/User.dart';
import '../../provider/auth_provider.dart';
import '../home/home.dart';
import 'camera_page.dart';
import 'package:provider/provider.dart';

enum JenisKelamin { pria, wanita }

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);


  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  JenisKelamin? gender = JenisKelamin.pria;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController tinggiTextController = TextEditingController(
        text: Provider.of<EditProvider>(context, listen: false).tinggiBadan);
    TextEditingController beratTextController = TextEditingController(
        text: Provider.of<EditProvider>(context, listen: false).beratBadan);
    TextEditingController umurTextController = TextEditingController(
        text: Provider.of<EditProvider>(context, listen: false).umur);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleEdit() async {
      if (_formKey.currentState!.validate()) {
      var calorie = calorieEquation(
          Provider.of<EditProvider>(context, listen: false).jenisAktivitas,
          (Provider.of<EditProvider>(context, listen: false).jenisKelamin.toString().split('.').last == 'pria') ? true : false,
          int.parse(beratTextController.text),
          int.parse(tinggiTextController.text),
          int.parse(umurTextController.text));


        if (await authProvider.edit(
            tinggiBadan: int.parse(tinggiTextController.text),
            beratBadan: int.parse(beratTextController.text),
            umur: int.parse(umurTextController.text),
            jenisKelamin:
            (Provider.of<EditProvider>(context, listen: false).jenisKelamin.toString().split('.').last == 'pria') ? true : false,
            jenisAktivitas:
            Provider
                .of<EditProvider>(context, listen: false)
                .jenisAktivitas,
            imt: imtEquation(int.parse(tinggiTextController.text),
                int.parse(beratTextController.text)),
            kalori: calorie,
            protein: (15 / 100 * calorie) / 4,
            karbohidrat: (60 / 100 * calorie) / 4,
            lemak: (25/100 * calorie) / 9)) {
          Provider
              .of<EditProvider>(context, listen: false)
              .reset;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Edit Berhasil"),
          ));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => HomeScreen(user: authProvider.user)),
                  (Route<dynamic> route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Edit Gagal"),
          ));
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Kalkulasi IMT & Kalori'),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Form(
                  key: _formKey,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomTextField(

                  validation:(value) {
                    if (value == null || value.isEmpty ) {
                      return 'Mohon isi data tinggi badan';
                    }
                    if(value.characters.length > 3){
                      return 'Masukkan format tinggi badan yang sesuai';
                    }
                    return null;
                  },
                  onChanged: Provider.of<EditProvider>(context, listen: false)
                      .setTinggiBadan,
                  controller: tinggiTextController,
                  label: "Tinggi Badan (cm)",
                  obscureText: false,
                  inputType: TextInputType.number,
              ),
              CustomTextField(

                  validation:(value) {
                    if (value == null || value.isEmpty ) {
                      return 'Mohon isi data berat badan';
                    }
                    if(value.characters.length > 3){
                      return 'Masukkan format berat badan yang sesuai';
                    }
                    return null;
                  },
                    onChanged: Provider.of<EditProvider>(context, listen: false)
                        .setBeratBadan,
                    controller: beratTextController,
                    label: "Berat Badan (kg)",
                    obscureText: false,
                    inputType: TextInputType.number),
              CustomTextField(
                  validation:(value) {
                    if (value == null || value.isEmpty ) {
                      return 'Mohon isi data umur';
                    }
                    if(int.parse(value) < 0 || int.parse(value) > 100){
                      return 'Masukkan format umur yang sesuai';
                    }
                    return null;
                  },
                    onChanged:
                        Provider.of<EditProvider>(context, listen: false).setUmur,
                    controller: umurTextController,
                    label: "Umur",
                    obscureText: false,
                    inputType: TextInputType.number),
              Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Jenis Kelamin",
                      style: TextStyle(fontSize: 15),
                    )),
              SizedBox(
                  height: 5,
              ),
              Consumer<EditProvider>(
                  builder: (context, edit, child) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text('Pria'),
                            leading: Radio<JenisKelamin>(
                              activeColor: primaryColor,
                              value: JenisKelamin.pria,
                              groupValue: edit.jenisKelamin,
                              onChanged: (JenisKelamin? value) {
                                if (value != null) {
                                  edit.setJenisKelamin(value);
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Wanita'),
                            leading: Radio<JenisKelamin>(
                              activeColor: primaryColor,
                              value: JenisKelamin.wanita,
                              groupValue: edit.jenisKelamin,
                              onChanged: (JenisKelamin? value) {
                                if (value != null) {
                                  edit.setJenisKelamin(value);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
              ),
              Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Jenis Aktivitas",
                      style: TextStyle(fontSize: 15),
                    )),
              SizedBox(
                  height: 5,
              ),
              Consumer<EditProvider>(
                  builder: (context, value, child) {
                    return DropdownButtonFormField(

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const <TextSpan>[
                                  TextSpan(text: 'Sangat Ringan\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  TextSpan(text: 'Tidak melakukan aktivitas fisik tambahan di luar aktivitas sehari-hari!', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ), value: "Sangat Ringan"),
                        DropdownMenuItem(child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(text: 'Ringan\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              TextSpan(text: 'Melakukan aktivitas fisik/olahraga ringan 1-3 hari/minggu', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ), value: "Ringan"),
                        DropdownMenuItem(child:RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(text: 'Sedang\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              TextSpan(text: 'Melakukan aktivitas fisik/olahraga sedang 3-5 hari/minggu', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ), value: "Sedang"),
                        DropdownMenuItem(child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(text: 'Aktif\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              TextSpan(text: 'Melakukan aktivitas fisik/olahraga tingkat tinggi 6-7 hari/minggu', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),value: "Berat"),
                        DropdownMenuItem(
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const <TextSpan>[
                                  TextSpan(text: 'Sangat Aktif\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  TextSpan(text: 'Melakukan aktivitas fisik/olahraga tingkat sangat berat atau atletik atau 2x latihan', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),  value: "Sangat Berat"),
                      ],
                      onChanged: (String? newValue) {
                        value.setJenisAktivitas(newValue!);
                      },
                      value: value.jenisAktivitas,
                      isExpanded: true,
                      itemHeight: 100,
                    );
                  },
              ),
              SizedBox(
                  height: 20,
              ),
              CustomButton(
                  onPressed: handleEdit,
                  label: (Provider.of<AuthProvider>(context, listen: false)
                              .editLoading ==
                          EditLoading.Loading)
                      ? "Loading.."
                      : "Edit",
                  color: primaryColor,
              )
            ]),
                ),
          )),
        ));
  }
}

calorieEquation(String jenisAktivitas, bool jenisKelamin, int beratBadan,
    int tinggiBadan, int umur) {
  var hasil;
  var bmr;
  double energi = 0;
  if (jenisAktivitas == "Sangat Ringan") {
    energi = 1.2;
  } else if (jenisAktivitas == "Ringan") {
    energi = 1.375;
  } else if (jenisAktivitas == "Sedang") {
    energi = 1.55;
  } else if (jenisAktivitas == "Berat") {
    energi = 1.725;
  } else {
    energi = 1.9;
  }
  if (jenisKelamin) {
   bmr = 66.47 +
        (13.75 * double.parse(beratBadan.toString())) +
        (5.003 * double.parse(tinggiBadan.toString())) -
        (6.755 * double.parse(umur.toString()));
    hasil = (bmr * energi);
  } else{
    bmr = 655.1 +
        (9.563 * double.parse(beratBadan.toString())) +
        (1.850 * double.parse(tinggiBadan.toString())) -
        (4.676 * double.parse(umur.toString()));
    hasil = (bmr * energi);
  }
  return hasil;
}

imtEquation(int tinggiBadan, int beratBadan) {
  var hasil = (beratBadan / ((tinggiBadan / 100) * (tinggiBadan / 100)));
  return hasil;
}
