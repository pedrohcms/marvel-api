import 'package:flutter/material.dart';
import 'package:marvel_api/src/services/HeroService.dart';

class CharacterProfileForm extends StatefulWidget {
  @override
  _CharacterProfileFormState createState() => _CharacterProfileFormState();
}

class _CharacterProfileFormState extends State<CharacterProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 1,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: 'Hero name',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await HeroService().show('Iron Man');
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
}
