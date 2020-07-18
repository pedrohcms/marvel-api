import 'package:flutter/material.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfile.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfileProvider.dart';
import 'package:marvel_api/src/pages/CharacterProfileForm/CharacterProfileFormProvider.dart';
import 'package:provider/provider.dart';

class MarvelApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CharacterProfileFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CharacterProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharacterProfile(),
      ),
    );
  }
}
