  import 'package:data/screens/login.dart';
  import 'package:data/screens/preloader.dart';
  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          unselectedWidgetColor: Colors.purple,
        ),
        home: Preloader(),
      );
    }
  }

