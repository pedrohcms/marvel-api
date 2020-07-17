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

  @override
  Widget build(BuildContext context) {
    CharacterProfileFormProvider characterProfileFormProvider =
        Provider.of<CharacterProfileFormProvider>(context);

    return Expanded(
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: characterNameController,
          maxLines: 1,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: 'Character name',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
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
    );
  }

  @override
  void dispose() {
    characterNameController.dispose();
    super.dispose();
  }
}
