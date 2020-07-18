import 'package:flutter/material.dart';
import 'package:marvel_api/src/models/Character.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfileProvider.dart';
import 'package:marvel_api/src/components/CharacterProfileForm/CharacterProfileForm.dart';
import 'package:provider/provider.dart';
import 'package:marvel_api/src/components/ImageResolver/ImageResolver.dart';

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
                      initialData: Character(
                          name: 'Search your hero first', thumbnailPath: ''),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }

                        return Column(
                          children: <Widget>[
                            // Hero Thumbnail

                            Container(
                              child: ImageResolver(
                                  image: snapshot.data.thumbnailPath),
                            ),
                            // Hero Info
                            Row(
                              children: <Widget>[
                                Text(snapshot.data.name),
                                Text(snapshot.data.description.isNotEmpty
                                    ? snapshot.data.description
                                    : 'No description avaible'),
                              ],
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
