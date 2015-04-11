library Canvas;

import 'dart:html';
import 'message.dart';
import 'choice.dart';
import 'room.dart';

abstract class Canvas {
  
  static CanvasRenderingContext2D _context;
  
  static get context {
    return _context;
  }
  
  static create() {
    DivElement main = querySelector('#main');
    CanvasElement canvas = new CanvasElement(width: 600, height: 400);
    _context = canvas.context2D;
    canvas.addEventListener('mousedown', _getPosition, false);
    main.append(canvas);
  } 
  
  static void _getPosition(event) {
    int clickX = event.client.x - event.currentTarget.offsetLeft;
    int clickY = event.client.y - event.currentTarget.offsetTop;
    
    _triggerEvent(clickX, clickY);    
  }
  
  static void _triggerEvent(int clickX, int clickY) {
    
    if (Message.isMessageActive) {
      Message.nextMessage();
    }
    
    else if (Choice.isChoiceActive) {
      Choice.submitChoice(clickX, clickY); 
    }
    
    else {    
      Room.roomAction(clickX, clickY);
    }
  }
  
  static void drawMessageBoard() {
    _context.setFillColorRgb(255, 255, 255);
    _context.setStrokeColorRgb(0, 0, 0);
    _context.fillRect(100, 100, 400, 150);
    _context.strokeRect(100, 100, 400, 150);
  }
  
  static void drawMessage(String text) {
    _context.setFillColorRgb(0, 0, 0);
    _context.fillText(text, 120, 120);
  }
  
  static void drawChoices(List options) {
    
  } 
  
}