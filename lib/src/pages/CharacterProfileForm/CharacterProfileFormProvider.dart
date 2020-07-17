import 'package:flutter/foundation.dart';
import 'package:marvel_api/src/models/Character.dart';
import 'package:marvel_api/src/pages/CharacterProfile/CharacterProfileProvider.dart';
import 'package:marvel_api/src/services/CharacterService.dart';

class CharacterProfileFormProvider extends ChangeNotifier {
  CharacterService characterService = new CharacterService();
  CharacterProfileProvider characterProfileProvider =
      CharacterProfileProvider();

  queryCharacter(String characterName) async {
    Character character = await characterService.show(characterName);
    characterProfileProvider.changeCharacter(character);
  }
}
