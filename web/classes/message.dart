library Message;

import 'gamedata.dart';
import 'gamestates.dart';
import 'canvas.dart';
import 'room.dart';


abstract class Message {

  static String _messageText;
  static bool _isMessageActive = false;
  
  static void toggleMessage ({String room, String trigger}) {
    List<Map> messageRange;
    
    if (_isMessageActive) {
      // TODO: is message a choice?
      _hideMessage();
    }

    else {
      messageRange = GameData.messages[room][trigger];
      _showMessage(messageRange);
    }
  }
  
  static void _showMessage(messageRange) {
    
    int messageRangeLength = messageRange.length;

    if (messageRangeLength == 1) {
      messageRange[0].forEach((k, v) { 
        _messageText = v;
      });
    }
    else {

      for (int i = 0; i < messageRangeLength; i++) {
        String state;
        String message;
        
        messageRange[i].forEach((k, v) { 
          state = k;
          message = v;
        });
        
        if(GameState.checkState(state)) {
          _messageText = message;
          // TODO: is message list or string? -> choice or message
          break;
        }
      }
      
    }
    
    if (!_isMessageActive) {
      Canvas.context.setFillColorRgb(255, 255, 255);
      Canvas.context.setStrokeColorRgb(0, 0, 0);
      Canvas.context.fillRect(100, 100, 400, 150);
      Canvas.context.strokeRect(100, 100, 400, 150);
      _isMessageActive = true;
    }
    
    // TODO: else -> continuous messages, message chains, choices.
    // redraw message block;
    
    Canvas.context.setFillColorRgb(0, 0, 0);
    Canvas.context.fillText(_messageText, 120, 120);
    
  }
  
  static void _hideMessage() {
    Room.reDrawRoom();
    _isMessageActive = false;
  }
  
}