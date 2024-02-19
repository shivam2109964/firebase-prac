import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasee/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    //Add Data 2
    void addDataTwo() async {
      //Create a new Document Reference
      DocumentReference documentReference =
          firebase.collection("users").doc("user 1");
      //Set data on the document
      await documentReference.set(
        {'name': 'Shivam Gupta', 'age': 30, 'email': 'sg2109964@gmail.com'},
      );
    }

    //Update data in Firestore
    void updateData() async {
      //Create a document reference
      DocumentReference documentReference =
          firebase.collection("users").doc("user 1");
      //Update the data on the document
      await documentReference.update(
        {
          "age": 22,
        },
      );
    }

    //Delete the data 2 from firestore
    void deleteData() async {
      //Create a document reference
      DocumentReference documentReference =
          firebase.collection("users").doc("user 1");
      //Delete the document
      await documentReference.delete();
    }

    //Fetch data from Firestore and Display

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    addDataTwo();
                  },
                  child: const Text(
                    "Add Data 2",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    updateData();
                  },
                  child: const Text(
                    "Update Data 2",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteData();
                  },
                  child: const Text(
                    "Delete Data ss2",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
