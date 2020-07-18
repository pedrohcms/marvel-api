import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:marvel_api/src/models/Character.dart';

class CharacterProfileProvider extends ChangeNotifier {
  StreamController<Character> _characterStreamController =
      StreamController<Character>();

  Sink<Character> get inputCharacter => _characterStreamController.sink;
  Stream<Character> get outputCharacter => _characterStreamController.stream;

  changeCharacter(Character character) {
    print(character.name);
    inputCharacter.add(character);
    notifyListeners();
  }

  @override
  void dispose() {
    _characterStreamController.close();
    super.dispose();
  }
}
