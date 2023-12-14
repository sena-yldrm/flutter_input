import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TarihSaatOrnek extends StatefulWidget {
  TarihSaatOrnek({Key? key}) : super(key: key);

  @override
  State<TarihSaatOrnek> createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnek> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime ucAyOncesi = suan.subtract(Duration(days: 3 * 30)); // 3 ay önce
    DateTime yirmiGunSonrasi = suan.add(Duration(days: 20)); // 20 gün sonra
    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Date time picker"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Saat Sec"),
              onPressed: () {
                showTimePicker(context: context, initialTime: suankiSaat)
                    .then((secilenSaat) {
                  if (secilenSaat != null) {
                    debugPrint(
                        "${secilenSaat.hour}:${secilenSaat.minute.toString()}");
                  }
                });
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
            ),
            ElevatedButton(
              child: Text("Tarih Sec"),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: suan,
                        firstDate: ucAyOncesi,
                        lastDate: yirmiGunSonrasi)
                    .then((secilenTarih) {
                  if (secilenTarih != null) {
                    debugPrint(secilenTarih.toString());
                    debugPrint(secilenTarih.toIso8601String());
                    print(formatDate(secilenTarih, [yy, '-', M, '-', d]));
                  }
                });
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
