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
  final TextStyle numberTitleStyle = TextStyle(
    color: Colors.grey[300],
    fontSize: 24.0,
  );

  final TextStyle numberValueStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 19.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                // Search Hero
                Expanded(
                  child: CharacterProfileForm(),
                  flex: 1,
                ),
                Expanded(
                  flex: 8,
                  child: Consumer<CharacterProfileProvider>(
                      builder: (context, characterProfileProvider, widget) {
                    return StreamBuilder<Character>(
                        stream: characterProfileProvider.outputCharacter,
                        initialData: Character(),
                        builder: (context, snapshot) {
                          print('Rebuild');
                          return SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: <Widget>[
                                  // Hero Thumbnail
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 15.0),
                                      child: ImageResolver(
                                        image: snapshot.data.thumbnailPath,
                                      ),
                                    ),
                                  ),
                                  // Hero Info
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Character Name:
                                      Text(
                                        'Name:',
                                        style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 28.0,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),

                                      // Character Description:
                                      Text(
                                        'Description:',
                                        style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 28.0,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.description,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),

                                      // Number of comics
                                      Text(
                                        'Number of comics:',
                                        style: numberTitleStyle,
                                      ),
                                      Text(
                                        '$snapshot.data.comics',
                                        style: numberValueStyle,
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),

                                      // Number of series
                                      Text(
                                        'Number of series:',
                                        style: numberTitleStyle,
                                      ),
                                      Text(
                                        '$snapshot.data.series',
                                        style: numberValueStyle,
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),

                                      // Number of stories
                                      Text(
                                        'Number of stories:',
                                        style: numberTitleStyle,
                                      ),
                                      Text(
                                        '$snapshot.data.stories',
                                        style: numberValueStyle,
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),

                                      // Number of events
                                      Text(
                                        'Number of events:',
                                        style: numberTitleStyle,
                                      ),
                                      Text(
                                        '$snapshot.data.events',
                                        style: numberValueStyle,
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
