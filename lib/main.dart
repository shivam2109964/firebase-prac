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
    //Add data
    void addData() async {
      await firebase.collection("List in Fire").add(
            ({"Om": "Jai Shree Ram"}),
          );
    }

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

    print("Sucessfully Created");
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
                    addData();
                  },
                  child: const Text(
                    "Add Data 1",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addDataTwo();
                  },
                  child: const Text(
                    "Add Data 2",
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
