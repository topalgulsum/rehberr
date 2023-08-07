import 'package:deneme1/kisiDetay.dart';
import 'package:deneme1/kisiEkle.dart';
import 'package:deneme1/model/contact.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  
  void _showDeleteConfirmationDialog(Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Kişiyi Sil"),
          content: Text("Bu kişiyi silmek istediğinizden emin misiniz?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // İletişim kutusunu kapat
              },
              child: Text("Vazgeç"),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteContact(contact); // Kişiyi sil
                Navigator.of(context).pop(); // İletişim kutusunu kapat
              },
              child: Text("Sil"),
            ),
          ],
        );
      },
    );
  }


  void _deleteContact(Contact contact) {
  setState(() {
    displayedContacts.remove(contact); // Kişiyi listeden kaldır
  });
}
  
  final List<Contact> allContacts = Contact.contacts;
  List<Contact> displayedContacts = [];

  @override
  void initState() {
    super.initState();
    displayedContacts = allContacts; // Başlangıçta tüm kişileri gösteriyoruz.
  }

  void _searchContacts(String searchQuery) {
    // Girilen metne göre kişileri filtrele ve yeni liste oluştur
    setState(() {
      displayedContacts = allContacts
          .where((contact) =>
              contact.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }
  void _sortContactsByName() {
    displayedContacts.sort((a, b) => a.name.compareTo(b.name));
    setState(() {}); // Listeyi sıraladıktan sonra Widget'ın yeniden çizilmesini sağlamak için setState kullanıyoruz
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Kişiler", style: TextStyle(color: Colors.black)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        splashColor: Color.fromARGB(255, 64, 139, 132),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KisiEkle()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  
                  onPressed: _sortContactsByName, // Kişileri A'dan Z'ye sıralamak için buton fonksiyonunu çağırıyoruz
                  child: Text("A-Z sırala", style: TextStyle(color: Colors.black), ),
                  
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _searchContacts, // Arama işlemini gerçekleştiren fonksiyonu çağırıyoruz
              decoration: InputDecoration(
                labelText: "Ara...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedContacts.length,
              itemBuilder: (context, index) {
                Contact contact = displayedContacts[index];
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactDetailPage(contact: contact),),);
                  },

                  trailing: IconButton(icon: Icon(Icons.delete),
                  onPressed: (){
                    _showDeleteConfirmationDialog(contact); 
                    //_deleteContact(contact);
                  },),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg1uMj0c-m9QJbCLtnqYuEMX1_56dYYxVJ5Q&usqp=CAU",
                    ),
                    child: Text(
                      contact.name[0],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(contact.name),
                      Text(contact.surname),
                    ],
                  ),
                  subtitle: Text(contact.phoneNumber),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
