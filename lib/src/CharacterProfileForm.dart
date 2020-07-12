import 'package:flutter/material.dart';

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
              onPressed: () {
                _formKey.currentState.validate();
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
