import 'package:flutter/material.dart';

class FormElemanlari extends StatefulWidget {
  const FormElemanlari({super.key});

  @override
  State<FormElemanlari> createState() => _FormElemanlariState();
}

class _FormElemanlariState extends State<FormElemanlari> {
  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
  String secilenRenk = "kırmızı";
  List<String> sehirler = ["Ankara", "Bursa", "İzmir", "Hatay"];
  String secilenSehir = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Diğer Form Elemanları"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          CheckboxListTile(
            value: checkBoxState,
            onChanged: (secildi) {
              checkBoxState = secildi!;
              setState(() {});
            },
            activeColor: Colors.purple,
            title: Text(
              "Checkbox Title",
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text('Checkbox Subtitle'),
            //genellikle ikonlar konulur
            secondary: Icon(Icons.add),
          ),
          RadioListTile<String>(
            value: 'Ankara',
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("secilen deger: $deger");
              });
            },
            title: Text('Ankara'),
            subtitle: Text('Subtitle'),
            secondary: Icon(Icons.key),
          ),
          RadioListTile<String>(
            value: 'Bursa',
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("secilen deger: $deger");
              });
            },
            title: Text('Bursa'),
            subtitle: Text('Subtitle'),
            secondary: Icon(Icons.key),
          ),
          RadioListTile<String>(
            value: 'İzmir',
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("secilen deger: $deger");
              });
            },
            title: Text('İzmir'),
            subtitle: Text('Subtitle'),
            secondary: Icon(Icons.key),
          ),
          SwitchListTile(
            value: switchState,
            onChanged: (deger) {
              debugPrint("anlasma onaylandı $deger");
              switchState = deger;
              setState(() {});
            },
            title: Text('Switch title'),
            subtitle: Text('Switch Subtitle'),
            secondary: Icon(Icons.refresh),
          ),
          Slider(
            value: sliderDeger,
            onChanged: (value) {
              print("$value");
              sliderDeger = value;
              setState(() {});
            },
            min: 10,
            max: 20,
            divisions: 20,
            label: sliderDeger.toString(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38),
            child: DropdownButton(
              items: const [
                DropdownMenuItem<String>(
                    child: Text("kırmızı"), value: "kırmızı"),
                DropdownMenuItem<String>(child: Text("mavi"), value: "mavi"),
                DropdownMenuItem<String>(child: Text("sarı"), value: "sarı"),
              ],
              onChanged: (secilen) {
                debugPrint("dropdown secildi : ${secilen}");
                secilenRenk = secilen!;
                setState(() {});
              },
              hint: Text("seciniz"),
              value: secilenRenk,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38),
            child: DropdownButton<String>(
              items: sehirler.map((oankiSehir) {
                return DropdownMenuItem<String>(
                  child: Text(oankiSehir),
                  value: oankiSehir,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  secilenSehir = value!;
                });
              },
              value: secilenSehir,
            ),
          )
        ],
      ),
    );
  }
}
