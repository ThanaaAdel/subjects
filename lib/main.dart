// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subjects/Card.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Subjects(),
    );
  }
}

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  State<Subjects> createState() => _QuotesState();
}

// class for card-quote(title, author)
class addSubject {
  String titleSubject;
  String doctor;
  addSubject({required this.titleSubject, required this.doctor});
}

class _QuotesState extends State<Subjects> {
  // list of all quotes
  List allInfo = [
    addSubject(doctor: "Ali Hassan", titleSubject: "Computer Science"),
    addSubject(
        doctor: "Sanaa Adel", titleSubject: "Artificail Entlegant"),
    addSubject(
        doctor: "Ali Elrayek",
        titleSubject: "Programming"),
    addSubject(
        doctor: "Amgad",
        titleSubject: "Data Mining "),
  ];

// To delete card-quote when clicking on delete icon
  delete(addSubject item) {
    setState(() {
      allInfo.remove(item);
    });
  }

// To add new card-quote to the main screen when clicking on "ADD" in showModalBottomSheet
  addNewSubject() {
    setState(() {
      allInfo.add(
        addSubject(doctor: myController2.text, titleSubject: myController.text),
      );
    });
  }

// create 2 controllers to get the text from the textfield
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(hintText: "Add new Subject"),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(hintText: "Add your Name"),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addNewSubject();
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Subjects",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: allInfo.map((item) => CardWidget(
            // To pass the( item inside the list) to "card.dart" file
            delete: delete,
            // To pass (the delete function) to "card.dart" file
            item: item,
          )).toList(),
        ),
      ),
    );
  }
}