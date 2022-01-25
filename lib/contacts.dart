import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List contactsList = ['엄마', '이소의', '14서은렬', '엄마아들'];

  addContacts(o) {
    contactsList.add(o);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: ListView.builder(
          itemCount: contactsList.length,
          itemBuilder: (c, i) {
            return ListTile(
              leading: Image.asset('assets/pp.png'),
              title: Text(contactsList[i]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (c) {
                  return dialogD();
                });
          },
        ),
      ),
    );
  }
}

class dialogD extends StatefulWidget {
  const dialogD({Key? key}) : super(key: key);
  @override
  _dialogDState createState() => _dialogDState();
}

class _dialogDState extends State<dialogD> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
      ),
    );
  }
}
