library Choice;

import 'gamedata.dart';
import 'room.dart';
import 'canvas.dart';


abstract class Choice {
  static Map _choice = new Map();
  static bool isChoiceActive = false;
  
  static toggleChoice(String choiceName) {
    
    List options;
    List optionsTexts = new List<String>();
    List optionsNames = new List<String>();
    int optionsLength = 0;
    
    if (!isChoiceActive) {
      isChoiceActive = true;
    }
    
    _choice = GameData.choices[Room.name][choiceName];
    // contains text, options and impact
    
    options = _choice['options'];
    optionsLength = options.length;
    
    Canvas.drawMessageBoard();
    Canvas.drawMessage(_choice['text']);
    
    
    for(int i = 0; i < optionsLength; i++) {
      options[i].forEach((name, text) { 
        optionsTexts.add(text);
        optionsNames.add(name);
      });
    }
    
    Canvas.drawChoices(optionsTexts);
    
    
  }
  
  static submitChoice(int clickX, int clickY) {
    
  }

}