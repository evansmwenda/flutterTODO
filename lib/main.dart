import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertodo/services/auth.dart';
import "package:lint/lint.dart";
// Import the firebase_core plugin
import "package:firebase_core/firebase_core.dart";

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAwesomeApp();
        }

        return const Scaffold(
          body: Center(
            child: Text("Loading..."),
          ),
        );
      },
    );
  }
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth(auth: _auth).user,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if(snapshot.connectionState == "active"){
          //do something
          if(snapshot.data.uid == null){
            //user not logged in->go to login screen
            //15:43(video)
          }else{
            //user logged in->go to home screen
          }
          return Text("textfield");
        }else{
          return const Scaffold(
            body: Center(
              child: Text("Loading..."),
            ),
          );
        }
      },
    );
  }
}
