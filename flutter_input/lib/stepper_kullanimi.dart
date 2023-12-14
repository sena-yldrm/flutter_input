import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  const StepperOrnek({super.key});

  @override
  State<StepperOrnek> createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  //burda değerleri oluştur ki sonra kullananıcıdan alabil
  int _aktifstep = 0;
  String? isim, mail, sifre;
  List<Step> tumStepler = [];
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  //eğer validation kısmında bir hata varsa stepperin basındaki isaretleri değiştiricez ünlem gibi
  bool hata = false;
  @override
  void initState() {
    // TODO: implement initState
    //metot çağırılıyor ve içindekini listeye atıyor
    tumStepler = _tumstepler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Ornek"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,
          currentStep: _aktifstep,
          onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifstep = tiklanilanStep;
            });
          },
          onStepContinue: () {
            if (_aktifstep < tumStepler.length - 1) {
              _aktifstep++;
              setState(() {});
            }
          },
          onStepCancel: () {
            if (_aktifstep > 0) {
              _aktifstep--;
              setState(() {});
            }
          },
        ),
      ),
    );
  }

  List<Step> _tumstepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username Giriniz"),
        subtitle: Text("Username Altbaşlık"),
        state: _stateleriAyarla(_aktifstep),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: const InputDecoration(
              focusColor: Colors.purple,
              label: Text("UsernameLabel"),
              hintText: "UsernameHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return 'Lütfen Username Boyutunu En Az 5 Karakterden Büyük Olacak Şekilde Giriniz';
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Mail Giriniz"),
        subtitle: Text("Mail Altbaşlık"),
        state: _stateleriAyarla(_aktifstep),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: const InputDecoration(
              label: Text("MailLabel"),
              hintText: "MailHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6 && girilenDeger.contains("@")) {
              return 'Geçerli Mail Adresini Giriniz';
            }
          },
          //eğer girilen değer doğruysa maili girilen değere atayacak
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Sifre Giriniz"),
        subtitle: Text("Sifre Altbaşlık"),
        state: _stateleriAyarla(_aktifstep),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: const InputDecoration(
              label: Text("SifreLabel"),
              hintText: "SifreHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return ' Şifre Boyutu En Az 5 Karakter Olmalı ';
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifstep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }
}
