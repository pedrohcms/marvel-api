import 'package:flutter/material.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfileProvider.dart';
import 'package:marvel_api/src/pages/CharacterProfileForm/CharacterProfileForm.dart';
import 'package:provider/provider.dart';

class CharacterProfile extends StatefulWidget {
  @override
  _CharacterProfileState createState() => _CharacterProfileState();
}

class _CharacterProfileState extends State<CharacterProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Search Hero
              CharacterProfileForm(),
              Consumer<CharacterProfileProvider>(
                  builder: (context, characterProfileProvider, widget) {
                return Column(
                  children: <Widget>[
                    // Hero Thumbnail
                    Container(),
                    // Hero Info
                    Row(
                      children: <Widget>[],
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
