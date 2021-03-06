import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:fluttertodo/screens/home.dart';
import 'package:fluttertodo/screens/login.dart';
import 'package:fluttertodo/services/auth.dart';
// Import the firebase_core plugin
import "package:firebase_core/firebase_core.dart";

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, //uncomment this line in production
      initialRoute: '/',
      routes: {
        '/': (context) => App(),
      }));
}

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),//_initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("snapshot"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Root();
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
        if (snapshot.connectionState == ConnectionState.active) {
          //do something
          //(await FirebaseAuth.instance.currentUser()).uid;

          if (snapshot.data?.uid == null) {
            //user not logged in->go to login screen
            //15:43(video)
            return Login(auth: _auth,firebaseFirestore: _firebaseFirestore,);
          } else {
            //user logged in->go to home screen
            return Home(auth: _auth,firebaseFirestore: _firebaseFirestore,);
          }
        } else {
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
