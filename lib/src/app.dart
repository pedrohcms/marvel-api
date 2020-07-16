import 'package:flutter/material.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfile.dart';
import 'package:provider/provider.dart';

class MarvelApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        home: CharacterProfile(),
      ),
    );
  }
}
