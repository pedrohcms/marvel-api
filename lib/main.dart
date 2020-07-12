import 'package:flutter/material.dart';
import 'package:marvel_api/src/CharacterProfile.dart';

void main() {
  runApp(MarvelApi());
}

class MarvelApi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CharacterProfile(),
    );
  }
}
