library Choice;

import 'gamedata.dart';
import 'room.dart';


abstract class Choice {
  static Map _choice = new Map();
  static bool isChoiceActive = false;
  
  static toggleChoice(String choiceName) {
    
    _choice = GameData.choices['Room.name']['choiceName'];
    // contains text, options and impact
  }
  
  static submitChoice(int clickX, int clickY) {
    
  }

}