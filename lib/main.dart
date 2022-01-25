import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'contacts.dart';
import 'Bsection.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      appBarTheme: AppBarTheme(color: Colors.purple),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      // print(contacts[0].familyName);
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('연락처 앱'),
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts))
        ],
      ),
      body: [Contacts(), Bsection()][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: 'contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'B섹션')
        ],
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
      ),
    );
  }
}
