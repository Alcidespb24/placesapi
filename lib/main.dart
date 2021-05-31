import 'package:flutter/material.dart';
import 'package:placesapi/bloc.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Bloc(),
      child: MaterialApp(
        home: Home()
      ),
    );
  }
}


