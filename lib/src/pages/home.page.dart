import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static String pageName = '/';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(body: SafeArea(child: Text("Hola Mundo!!!!")),),
    );
  }
}