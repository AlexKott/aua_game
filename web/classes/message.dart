library Message;

import 'gamedata.dart';
import 'canvas.dart';

abstract class Message {
  static Map<String, String> _messageOptions;
  static String _messageText;
  static bool _isMessageActive = false;
  
  static void toggleMessage ({String room, String trigger}) {
    if (_isMessageActive) _hideMessage();

    else _showMessage(room, trigger);
  }
  
  static void _showMessage(room, trigger) {
    _messageOptions = GameData.messages[room][trigger];
    
    if (_messageOptions.length > 1) {
      // TODO State check and choose message
      _messageText = _messageOptions['default'];
    }
    else {
      _messageText = _messageOptions['default'];
    }
    
    if (!_isMessageActive) {
      Canvas.context.setFillColorRgb(255, 255, 255);
      Canvas.context.setStrokeColorRgb(0, 0, 0);
      Canvas.context.fillRect(100, 100, 400, 150);
      Canvas.context.strokeRect(100, 100, 400, 150);
      _isMessageActive = true;
    }
    
    Canvas.context.setFillColorRgb(0, 0, 0);
    Canvas.context.fillText(_messageText, 120, 120);
    
  }
  
  static void _hideMessage() {
    // TODO clear screen and redraw room
    Canvas.context.setFillColorRgb(255, 255, 255);
    Canvas.context.fillRect(0, 0, 600, 150);
    _isMessageActive = false;
  }
  
}