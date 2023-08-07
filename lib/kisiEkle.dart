import 'package:flutter/material.dart';
import 'model/contact.dart'; // Varsayılan olarak model dosyasının yolunu ayarlayın

class KisiEkle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Kişi Ekle",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: KisiEkleForm(),
    );
  }
}

class KisiEkleForm extends StatefulWidget {
  @override
  _KisiEkleFormState createState() => _KisiEkleFormState();
}

class _KisiEkleFormState extends State<KisiEkleForm> {

  

void _showDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Bilgi"),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // İletişim kutusunu kapatır
            },
            child: Text("Tamam"),
          ),
        ],
      );
    },
  );
}

  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String name;
    String surname;
    String phoneNumber;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(hintText: "Ad",labelText: "Ad"),
                validator: (value) {
                  if (value == "") {
                    return "Lütfen bir ad giriniz!";
                  }
                },
                //onSaved: (value){
                // name=value},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controller1,
                decoration: InputDecoration(hintText: "Soyad", labelText: "Soyad"),
                validator: (value) {
                  if (value == "") {
                    return "Lütfen bir soyad giriniz!";
                  }
                },
                //onSaved: (value) {
                //surname = value; // Soyadı kaydediyoruz
                //},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controller2,
                decoration: InputDecoration(hintText: "Numara",labelText: "Numara"),
                validator: (value) {
                  if (value == "" || value!.length < 11) {
                    return "Eksik girdiniz";
                  }
                },
                // onSaved: (value) {
                // phoneNumber = value; // Numarayı kaydediyoruz
                //},
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                ElevatedButton(
                  
                  child:
                      Text("Kişi Ekle", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Contact.contacts.add(Contact(
                          name: controller.text,
                          surname: controller1.text,
                          phoneNumber: controller2.text));
                      setState(() {});
                      Navigator.pop(context);
                      _showDialog("Kişi başarıyla eklendi!");
                    }

                    // Bu kısımda ElevatedButton tıklandığında yapılacak işlemler
                  },
                ),
                ElevatedButton(
                  
                  child: Text("İptal", style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    // Kişi ekleme işlemi iptal ediliyor, ana sayfaya geri dönüyoruz.
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}