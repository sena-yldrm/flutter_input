import 'package:flutter/material.dart';

class GlobalKeyKullabimi extends StatelessWidget {
  GlobalKeyKullabimi({super.key});
  final sayacWidgetKey = GlobalKey<_SayacWidgetState>();
  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("butona basılma miktarı"),
            SayacWidget(
              key: sayacWidgetKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //state: veri SayacWidget daki _sayac verisine ulaş
          sayacWidgetKey.currentState!.arttir();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {
  const SayacWidget({super.key});

  @override
  State<SayacWidget> createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  void arttir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("2");
    return Text(
      _sayac.toString(),
      style: TextStyle(fontSize: 20),
    );
  }
}
