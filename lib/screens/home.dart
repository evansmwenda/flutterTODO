import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodo/services/auth.dart';

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
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("fluttrT0D0"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final String retVal =
              await Auth(auth: widget.auth).signOut();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body:  Builder(
        builder: (context) => Center(
          child: RaisedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // Find the Scaffold in the widget tree and use
              // it to show a SnackBar.
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar'),
          ),
        ),
      )
    );
  }
}
