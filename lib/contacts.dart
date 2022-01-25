import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List contactsList = ['엄마', '이소의', '14서은렬', '엄마아들'];

  addContacts(o) {
    setState(() {
      contactsList.add(o);
    });
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
          backgroundColor: Colors.purple,
          onPressed: () {
            showDialog(
                context: context,
                builder: (c) {
                  return dialogD(
                      addContacts: addContacts, contactsList: contactsList);
                });
          },
        ),
      ),
    );
  }
}

class dialogD extends StatelessWidget {
  dialogD({Key? key, this.addContacts, this.contactsList}) : super(key: key);
  final addContacts;
  final contactsList;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(controller: inputData),
            TextButton(
                onPressed: () {
                  addContacts(inputData.text);
                  Navigator.pop(context);
                },
                child: Text('완료')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소.'))
          ],
        ),
      ),
    );
  }
}
