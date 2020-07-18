import 'package:flutter/material.dart';
import 'package:marvel_api/src/models/Character.dart';
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
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/marvel3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Search Hero
                CharacterProfileForm(),
                Consumer<CharacterProfileProvider>(
                    builder: (context, characterProfileProvider, widget) {
                  return StreamBuilder<Character>(
                      stream: characterProfileProvider.outputCharacter,
                      initialData: Character(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container();
                        }

                        return Column(
                          children: <Widget>[
                            // Hero Thumbnail
                            Container(
                              child: Image.network(snapshot.data.thumbnailUrl),
                            ),
                            // Hero Info
                            Row(
                              children: <Widget>[],
                            ),
                          ],
                        );
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
