import 'package:flutter/material.dart';
import 'package:marvel_api/src/pages/CharacterProfileForm/CharacterProfileFormProvider.dart';
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
          ));

  @override
  Widget build(BuildContext context) {
    CharacterProfileFormProvider characterProfileFormProvider =
        Provider.of<CharacterProfileFormProvider>(context);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: characterNameController,
            cursorColor: Colors.white,
            autocorrect: false,
            maxLines: 1,
            onFieldSubmitted: (value) {
              if (_formKey.currentState.validate()) {
                characterProfileFormProvider
                    .queryCharacter(characterNameController.text);
              }
            },
            textInputAction: TextInputAction.search,
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: characterNameInputBorderDecoration,
              focusedBorder: characterNameInputBorderDecoration,
              focusedErrorBorder: characterNameInputBorderDecoration,
              errorStyle: TextStyle(color: Colors.white, fontSize: 14.0),
              hintText: 'Character name',
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    characterProfileFormProvider
                        .queryCharacter(characterNameController.text);
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
      ),
    );
  }

  @override
  void dispose() {
    characterNameController.dispose();
    super.dispose();
  }
}
