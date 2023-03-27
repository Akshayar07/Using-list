import 'dart:async';
import 'dart:convert';
import 'package:data/screens/login.dart';
import 'package:flutter/material.dart';

class Preloader extends StatefulWidget {
  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image(
        image: AssetImage(
          'assets/logo.png',
        ),
        height: 50,
        width: 50,
      ),
    );
  }
}

