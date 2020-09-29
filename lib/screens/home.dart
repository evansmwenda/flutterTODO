import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final FirebaseAuth auth ;
  final FirebaseFirestore firebaseFirestore ;

  // ignore: public_member_api_docs
  const Home({
    Key key,
    @required this.auth,
    @required this.firebaseFirestore
  }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text("Homepage"),
      ),
    );
  }
}
