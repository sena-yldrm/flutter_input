import 'package:flutter/material.dart';
import 'package:flutter_input/date_time_picker.dart';
import 'package:flutter_input/diger_form_elemanlari.dart';
import 'package:flutter_input/global_key_kullanimi.dart';
import 'package:flutter_input/stepper_kullanimi.dart';
import 'package:flutter_input/text_form_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: StepperOrnek(),
    );
  }
}

class TextFieldIslemleri extends StatefulWidget {
  const TextFieldIslemleri({super.key});

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;
  @override
  //uygulama başladığında bir kere çalışır genellikle atamalar burada yapılır
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "sena@sena.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else
          maxLineCount = 1;
      });
    });
  }

  @override
  void dispose() {
    // TODO: yok etmek istediğimiz ifadeler
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextField Islemleri")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailController,

              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              //autofocus: true dersen direkt o kutudan başlıcaktır yazmaya
              autofocus: true,
              //max 5 satır
              maxLines: maxLineCount,
              //max 20 karakter
              maxLength: 30,
              cursorColor: Colors.grey,
              //TODO dekorasyon
              decoration: const InputDecoration(
                labelText: "label text",
                hintText: "E mail giriniz",
                //textin başında
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.add_alert_rounded),
                /* 
                  text yazdığın kutucuğu değiştirmek istersen
                  *filled: true,
                  *fillColor: Colors.amber, */
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
              ),
              onChanged: (String deger) {
                if (deger.length > 3) {
                  setState(() {
                    _emailController.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(
                        offset: deger.length,
                      ),
                    );
                  });
                }
              },
              //onchanged ile farkı burası action yani giriş onaylama butonuna bastığında yazar
              onSubmitted: (value) {
                print('$value submit girildi.');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _emailController.text = "fsenayildirim@gmail.com";
          setState(() {});
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
