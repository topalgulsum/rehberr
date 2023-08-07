import 'package:flutter/material.dart';
import 'model/contact.dart';
import 'edit_contact_page.dart';

class ContactDetailPage extends StatefulWidget {
  Contact contact;

  ContactDetailPage({required this.contact});

  @override
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Detay"),
        actions: [
          IconButton(
            onPressed: () async {
              final updatedContact = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContactPage(contact: widget.contact),
                ),
              );

              if (updatedContact != null) {
                setState(() {
                  widget.contact = updatedContact;
                });
              }
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg1uMj0c-m9QJbCLtnqYuEMX1_56dYYxVJ5Q&usqp=CAU",
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: widget.contact.name,
              readOnly: true,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: "Ad",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: widget.contact.surname,
              readOnly: true,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: "Soyad",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: widget.contact.phoneNumber,
              readOnly: true,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: "Numara",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
