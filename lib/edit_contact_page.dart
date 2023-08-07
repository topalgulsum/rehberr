import 'package:flutter/material.dart';
import 'model/contact.dart';

class EditContactPage extends StatefulWidget {
  final Contact contact;

  EditContactPage({required this.contact});

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.contact.name;
    surnameController.text = widget.contact.surname;
    phoneNumberController.text = widget.contact.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Düzenle"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Kişi bilgilerini düzenlemek için TextFormField'ları ekleyin
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Ad",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: surnameController,
                decoration: InputDecoration(
                  labelText: "Soyad",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: "Numara",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Düzenleme işlemi tamamlandığında güncellenmiş kişi bilgilerini ana sayfaya geri döndürün
                  Contact updatedContact = Contact(
                    name: nameController.text,
                    surname: surnameController.text,
                    phoneNumber: phoneNumberController.text,
                  );
                  Navigator.pop(context, updatedContact);
                },
                child: Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
