import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
   final FirebaseAuth auth ;
   final FirebaseFirestore firebaseFirestore ;

  // ignore: public_member_api_docs
  const Login({
    Key key,
    @required this.auth,
    @required this.firebaseFirestore
}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;

  final pinController = TextEditingController();
  final idController = TextEditingController();

  FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pinController.dispose();
    idController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("fluttrT0D0"),
        // Set the background color of the App Bar
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid ID Number';
                          }
                          return null;
                        },
//                        style: TextStyle(
//                          color: Colors.white,
//                        ),
//                        cursorColor: Colors.white,
                        controller: idController,
                        focusNode: myFocusNode,
                        decoration: InputDecoration(
                          labelText: "ID Number",
//                          labelStyle: TextStyle(color: Colors.white,),
                          contentPadding: EdgeInsets.all(12.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid Password';
                          }
                          return null;
                        },
//                        style: TextStyle(
//                          color: Colors.white,
//                        ),
//                        onFieldSubmitted: (_) => _loginUser(),
                        maxLength: 4,
                        obscureText: _obscureText,
//                        cursorColor: Colors.white,
                        controller: pinController,
                        decoration: InputDecoration(
                            labelText: "Password",
                            contentPadding: EdgeInsets.all(12.0),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors
                                    .green, //Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  //change the state upon click
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            labelStyle: TextStyle(color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: FlatButton(
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          textColor: Colors.green,
                          onPressed: () async {},
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0, // match_parent
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () async {},
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0, // match_parent
                          child: RaisedButton(
                            color: Colors.grey,
                            onPressed: () async {},
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 18.0,color: Colors.black,),
                          ),
                          FlatButton(
                            padding: EdgeInsets.only(left: 0.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.green,
                              ),
                            ),
                            onPressed: () async {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
