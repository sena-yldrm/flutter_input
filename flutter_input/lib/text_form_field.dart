import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFORMfield extends StatefulWidget {
  const TextFORMfield({super.key});

  @override
  State<TextFORMfield> createState() => _TextFORMfieldState();
}

class _TextFORMfieldState extends State<TextFORMfield> {
  String _email = "", _password = "", _username = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textform field kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            //bu yazarken eksik girdiğinde hata mesajları veriyor
            //allways yaparsan tıklamadan bile yanlış sayar
            //onUserInteraction yaparsan tıkladığında hatayı görmeye başlarsın
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                //formun validate olması değerlerin alınması resetlenmesi için formla sarmalaman lazım
                TextFormField(
                  //ilk atanan değer
                  // initialValue: "senayildirim",
                  decoration: InputDecoration(
                    //ilk girişte senayildirim yazıyor sildiğinde hintteki username geliyor
                    //label text username ise border yani çerçevenin üstünde kalıyor
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.purple),
                  ),
                  onSaved: (deger) {
                    _username = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return "Username en az 4 karakter olmalı!!";
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //@ işaretini klavyeye ekler
                  keyboardType: TextInputType.emailAddress,
                  //ilk atanan değer
                  //initialValue: "senayildirim@gmail.com",
                  decoration: InputDecoration(
                    //ilk girişte senayildirim yazıyor sildiğinde hintteki username geliyor
                    //label text username ise border yani çerçevenin üstünde kalıyor
                    labelText: "E-mail",
                    hintText: "E-mail",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.purple),
                  ),
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (deger) {
                    if(deger!.isEmpty){
                      return 'Lütfen bir e-posta adresi giriniz!';
                    }
                    else if (EmailValidator.validate(deger!)) {
                      return "Geçerli E-mail giriniz!!";
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.purple),
                  ),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return "Password en az 4 karakter olmalı!!";
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    //butonun yukarıda tanımlı forma ulaşması için
                    bool _validate = _formkey.currentState!.validate();
                    if (_validate) {
                      _formkey.currentState!.save();
                      String result =
                          "username: $_username\n email:$_email\n sifre: $_password";
                      print(result);
                      ScaffoldMessenger.of(context).showSnackBar(
                        //SnackBar, ekranın altında kısa bir mesaj görüntülemek için kullanılan bir materyal tasarım bileşenidir
                        SnackBar(
                          content: Text(result),
                        ),
                      );
                      //işim bittikten sonra resetle girdiğim textleri temizliyor
                      _formkey.currentState!.reset();
                    }
                  },
                  child: Text("Onayla"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
