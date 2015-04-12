library Message;

import 'gamedata.dart';
import 'gamestates.dart';
import 'canvas.dart';
import 'room.dart';
import 'choice.dart';


abstract class Message {
  
  static bool isMessageActive = false;
  static int _activeMessage = 0;
  static List _messageList;
  
  
  static void toggleMessage ({String room, String trigger}) {
    var messageRange;
        
    messageRange = GameData.messages[room][trigger];
    
    _messageList = _pickMessage(messageRange);
    _defineMessage();
  }
  
  
  static void nextMessage() {
    _activeMessage++;
    _defineMessage();
  }
  
  // depending on the game state this one selects a list of messages 
  static List _pickMessage(messageRange) {
    
    int messageRangeLength = messageRange.length;
    List messageList = new List();

      if (messageRangeLength == 1) { // the default value
        messageRange[0].forEach((k, v) { 
          messageList = v;
        });
      }
      
      else {
        for (int i = 0; i < messageRangeLength; i++) {
          
          messageRange[i].forEach((state, list) { 
            if(GameState.checkState(state)) {
              messageList = list;
            }
          });
          
          if(messageList.length != 0) { // messages loaded
            break;
          }
        }
      }
      
      return messageList;
  }
  
  
  static void _defineMessage() {
    if(_messageList.length == _activeMessage) { // was the last message
      _hideMessage();
    }
    
    else if(_messageList[_activeMessage] is String) { // is a new message
      _showMessage(_messageList[_activeMessage]);
    }
    
    else {                                        // is a choice
      Choice.toggleChoice(_messageList[_activeMessage]['choice']);
    }
  }
  

  
  static void _showMessage(String messageText) {
    
    if (!isMessageActive) {
      isMessageActive = true;
    }
    
    Canvas.drawMessageBoard();
    Canvas.drawMessage(messageText);    
  }
  
  
  static void _hideMessage() {
    Room.reDrawRoom();
    _activeMessage = 0;
    isMessageActive = false;
  }
  
}