import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/src/models/Character.dart';
import 'package:marvel_api/src/services/CharacterService.dart';

class CharacterProfileFormProvider extends ChangeNotifier {
  CharacterService characterService = new CharacterService();

  Future<Character> queryCharacter(String characterName) async {
    return await characterService.show(characterName);
  }
}
