import 'package:flutter/material.dart';
import 'package:food/screen/adminAdvanceCredit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool changeColor = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => changeColor,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AdminAdvanceCredit(),
      ),
    );
  }
}
