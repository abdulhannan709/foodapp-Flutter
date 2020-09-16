import 'dart:math';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screens/login.dart';
import 'package:foodapp/screens/signup.dart';
import 'package:foodapp/widgets/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'mainscreen.dart';

class welcomescreen extends StatefulWidget {
  @override
  _welcomescreenState createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: null,
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
            child: Container(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new ClipRect(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200.withOpacity(0.5)),
                      child: Row(
                        children: <Widget>[
                          Hero(
                            tag: 'logo',
                            child: Container(
                              child: Image.asset('images/foodicon.png'),
                              height: 60.0,
                            ),
                          ),
                          Text(
                            'Food App',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Material(
                  elevation: 5.0,
                  color: mainaccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder: (_, __, ___) => loginscreen(),
                        ),
                      );
                      //Go to login screen.
                    },
                    minWidth: 200.0,
                    height: 50.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5.0,
                  color: mainaccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder: (_, __, ___) => signupscreen(),
                        ),
                      );
                    },
                    minWidth: 200.0,
                    height: 50.0,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
