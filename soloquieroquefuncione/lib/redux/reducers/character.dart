import 'package:soloquieroquefuncione/models/Character.dart';

import 'package:soloquieroquefuncione/redux/actions/character.dart';

List<Character> characterReducer(List<Character> newState, dynamic action) {
  if (action == CharacterActions.SetCharacters) {
    return newState;
  }
  return [Character()];
}
