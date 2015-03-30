library GameState;

import 'gamedata.dart';

abstract class GameState {
  static Map<String, bool> _states = {
    "gameLoaded": true,
    "drankWater": false,
    "answeredPhone": false
  };
  
  static _changeState(String state) {
    _states[state] = true;
  }
  
  static checkState(String state) {
    return _states[state];
  }
  
  static setState (String state) {
    if (_states[state]) {
      return;
    }
    else {
      List condition = GameData.gamestates[state]['states'];
      int conditionLength = condition.length;
      bool allowSetState = true;
      
      for (int i = 0; i < conditionLength; i++) {
        if (checkState(condition[i])) continue;
        
        else {
          allowSetState = false;
          break;
        }
      }
      if (allowSetState) {
        _changeState(state);
      }
    }
  }
}