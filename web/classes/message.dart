library Message;

import 'gamedata.dart';
import 'gamestates.dart';
import 'canvas.dart';
import 'room.dart';


abstract class Message {

  static String _messageText;
  static bool _isMessageActive = false;
  
  static void toggleMessage ({String room, String trigger}) {
    Map<String, String> messageRange;
    
    if (_isMessageActive) {
      _hideMessage();
    }

    else {
      messageRange = GameData.messages[room][trigger];
      _showMessage(messageRange);
    }
  }
  
  static void _showMessage(messageRange) {

    if (messageRange.length > 1) {
      
      // TODO for each option state check
      
      _messageText = messageRange['default'];
    }
    else {
      _messageText = messageRange['default'];
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