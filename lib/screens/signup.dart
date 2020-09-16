import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodapp/widgets/Constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'mainscreen.dart';

class signupscreen extends StatefulWidget {
  static String id = "registration_screen";

  @override
  _signupscreenState createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mainimage1.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: new ClipRect(
                child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 450.0,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Hero(
                              tag: 'logo',
                              child: Container(
                                height: 200.0,
                                child: Image.asset('images/foodicon.png'),
                              ),
                            ),
                            SizedBox(
                              height: 28.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: mainaccent, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: mainaccent, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            TextField(
                              obscureText: true,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your password.',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: mainaccent, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: mainaccent, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Material(
                              color: mainaccent.withOpacity(0.9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              elevation: 5.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  try {
                                    final newUser = await _auth.createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    if (newUser != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainScreen()),
                                      );
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                minWidth: double.infinity,
                                height: 50.0,
                                child: Text(
                                  'Sign Up',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
