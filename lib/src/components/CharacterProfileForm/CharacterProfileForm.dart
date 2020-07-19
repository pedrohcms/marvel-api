import 'package:flutter/material.dart';
import 'package:marvel_api/src/components/CharacterProfileForm/CharacterProfileFormProvider.dart';
import 'package:marvel_api/src/models/Character.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfileProvider.dart';
import 'package:provider/provider.dart';

class CharacterProfileForm extends StatefulWidget {
  @override
  _CharacterProfileFormState createState() => _CharacterProfileFormState();
}

class _CharacterProfileFormState extends State<CharacterProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final characterNameController = TextEditingController();

  final OutlineInputBorder characterNameInputBorderDecoration =
      OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide(
      color: Colors.white,
      style: BorderStyle.solid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    CharacterProfileFormProvider characterProfileFormProvider =
        Provider.of<CharacterProfileFormProvider>(context);

    CharacterProfileProvider characterProfileProvider =
        Provider.of<CharacterProfileProvider>(context);

    return Padding(
      padding: EdgeInsets.only(
        top: 5.0,
      ),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: characterNameController,
          cursorColor: Colors.white,
          autocorrect: false,
          maxLines: 1,
          onFieldSubmitted: (value) async {
            if (_formKey.currentState.validate()) {
              Character character = await characterProfileFormProvider
                  .queryCharacter(characterNameController.text);

              characterProfileProvider.changeCharacter(character);
            }
          },
          textInputAction: TextInputAction.search,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: characterNameInputBorderDecoration,
            focusedBorder: characterNameInputBorderDecoration,
            errorBorder: characterNameInputBorderDecoration,
            focusedErrorBorder: characterNameInputBorderDecoration,
            errorStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            hintText: 'Character name',
            hintStyle: TextStyle(
              color: Colors.grey[300],
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  Character character = await characterProfileFormProvider
                      .queryCharacter(characterNameController.text);

                  characterProfileProvider.changeCharacter(character);
                }
              },
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a hero name';
            }
            return null;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    characterNameController.dispose();
    super.dispose();
  }
}
