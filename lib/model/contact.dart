class Contact {
  
  String name;
  String surname;
  String phoneNumber;

  static List<Contact> contacts = [
    Contact(name: "Gülsüm", surname: "", phoneNumber: "0555 555 55 55"),
    Contact(name: "Begüm", surname: "",  phoneNumber: "0555 666 66 66"),
    Contact(name: "Kaan", surname: "", phoneNumber: "0555 777 77 77"),
    Contact(name: "Ali", surname: "",phoneNumber: "0555 888 88 88"),
    Contact(name: "Ayşe",surname: "", phoneNumber: "0555 999 99 99"),
    Contact(name: "İrem",surname: "", phoneNumber: "0555 444 44 44"),
    Contact(name: "Gizem", surname: "",phoneNumber: "0555 333 33 33"),
    Contact(name: "Nur",surname: "", phoneNumber: "0555 222 22 22"),
    Contact(name: "Zeynep", surname: "",phoneNumber: "0555 111 11 11"),
    Contact(name: "Mehmet", surname: "",phoneNumber: "0555 312 12 12"),
    Contact(name: "Eren", surname: "",phoneNumber: "0555 312 12 12"),
    Contact(name: "Ömer", surname: "", phoneNumber: "0555 312 12 12"),
  ];

  Contact(
      {required this.name,
      required this.surname,
      required this.phoneNumber}); // böyle bir değer vermemiz gerekiyor.
}
