import 'package:flutter/material.dart';

import '../../provider/bobot_provider.dart';
import '../../theme.dart';
import 'package:provider/provider.dart';

class BobotEditSlider extends StatelessWidget {
  const BobotEditSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BobotProvider bobotProvider =
        Provider.of<BobotProvider>(context, listen: false);
    handleEdit(double kalori, double protein, double karbohidrat, double lemak,
        double jumlahMakan) async {
      if (await bobotProvider.insertBobot(
          kalori: int.parse(kalori.toStringAsFixed(0)),
          protein: int.parse(protein.toStringAsFixed(0)),
          karbohidrat: int.parse(karbohidrat.toStringAsFixed(0)),
          lemak: int.parse(
            lemak.toStringAsFixed(0),
          ),
          jumlahMakan: int.parse(jumlahMakan.toStringAsFixed(0)))) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Bobot Berhasil Disimpan"),
        ));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Bobot Gagal Disimpan"),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Atur Preferensi Bobot"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Atur Preferensi Bobot Gizimu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Kalori"),
            Consumer<BobotProvider>(
              builder: (context, value, child) {
                return Slider(
                    activeColor: primaryColor,
                    value: value.editBobot[0],
                    max: 5,
                    min: 1,
                    divisions: 4,
                    label: value.editBobot[0].round().toString(),
                    onChanged: (double nilai) {
                      value.setBobot(nilai, 0);
                    });
              },
            ),
            Text("Protein"),
            Consumer<BobotProvider>(
              builder: (context, value, child) {
                return Slider(
                    activeColor: primaryColor,
                    value: value.editBobot[1],
                    max: 5,
                    min: 1,
                    divisions: 4,
                    label: value.editBobot[1].round().toString(),
                    onChanged: (double nilai) {
                      value.setBobot(nilai, 1);
                    });
              },
            ),
            Text("Karbohidrat"),
            Consumer<BobotProvider>(
              builder: (context, value, child) {
                return Slider(
                    activeColor: primaryColor,
                    value: value.editBobot[2],
                    max: 5,
                    min: 1,
                    divisions: 4,
                    label: value.editBobot[2].round().toString(),
                    onChanged: (double nilai) {
                      value.setBobot(nilai, 2);
                    });
              },
            ),
            Text("Lemak"),
            Consumer<BobotProvider>(
              builder: (context, value, child) {
                return Slider(
                    activeColor: primaryColor,
                    value: value.editBobot[3],
                    max: 5,
                    min: 1,
                    divisions: 4,
                    label: value.editBobot[3].round().toString(),
                    onChanged: (double nilai) {
                      value.setBobot(nilai, 3);
                    });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<BobotProvider>(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Text(
                          "Jumlah Makan Dalam Sehari",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            value.jumlahHarian(false);
                          },
                        ),
                        Text(
                          value.editBobot[4].toStringAsFixed(0),
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            value.jumlahHarian(true);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "Preferensi bobot gizi merupakan tingkat kecocokan gizi makanan dengan kebutuhanmu\n\n1 = Rendah\n2 = Sangat Rendah\n3 = Sedang\n4 = Tinggi\n5 = Sangat Tinggi")),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Semakin tinggi nilai bobot suatu kriteria, maka kesesuaian kriteria gizi tersebut akan diprioritaskan dalam rekomendasi",
                  style: TextStyle(color: Colors.grey),
                )),
            SizedBox(
              height: 20,
            ),
            Consumer<BobotProvider>(builder: (context, value, child) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    handleEdit(
                        value.editBobot[0],
                        value.editBobot[1],
                        value.editBobot[2],
                        value.editBobot[3],
                        value.editBobot[4]);
                  },
                  child: Text("Simpan Preferensi"));
            }),
          ],
        ),
      )),
    );
  }
}
