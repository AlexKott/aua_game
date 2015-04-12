library Canvas;

import 'dart:html';
import 'message.dart';
import 'choice.dart';
import 'room.dart';

abstract class Canvas {
  
  static CanvasRenderingContext2D _context;
  
  // TODO: get screen size and define canvas size
  
  static int canvasWidth = 600;
  static int canvasHeight = 400;
  
  static get context {
    return _context;
  }
  
  static create() {
    DivElement main = querySelector('#main');
    CanvasElement canvas = new CanvasElement(width: canvasWidth, height: canvasHeight);
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
    
    // get proportional board size and position , according to the actual
    // canvas size, defined at gameload
    
    double boardWidth = ( canvasWidth * 2 ) / 3;
    double boardHeight = ( canvasHeight * 2 ) / 3;
    
    double bPosX = ( canvasWidth - boardWidth ) / 2;
    double bPosY = ( canvasHeight - boardHeight ) / 2;
    
    
    _context.setFillColorRgb(255, 255, 255);
    _context.setStrokeColorRgb(0, 0, 0);
    _context.fillRect(bPosX, bPosY, boardWidth, boardHeight);
    _context.strokeRect(bPosX, bPosY, boardWidth, boardHeight);
  }
  
  static void drawMessage(String text) {
    _context.setFillColorRgb(0, 0, 0);
    _context.fillText(text, 120, 120);
  }
  
  static void drawChoices(List<String> options) {
    int oLength = options.length;
    double posX;
    int posY;
    
    _context.textAlign = 'center';
    
    for (int i = 0; i < oLength; i++) {
      
      if (i < 2) {
        posX = ( ( 400 / 2 ) * i ) + 200;
        posY = 200;
      }
      
      else if (i < 4) {
        posX = ( ( 400 / 2 ) * (i - 2) ) + 200;
        posY = 230;
      }
      
      _context.fillText(options[i], posX, posY);
      
    }
    
    
    
    
  } 
  
}