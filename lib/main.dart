import 'package:flutter/material.dart';
import 'home.dart';

void main(){
  runApp(Atmos());
}

class Atmos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
