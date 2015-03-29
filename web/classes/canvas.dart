library Canvas;

import 'dart:html';
import 'message.dart';
import 'room.dart';
import 'item.dart';

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
    String trigger;
    int clickX = event.clientX - event.currentTarget.offsetLeft;
    int clickY = event.clientY - event.currentTarget.offsetTop;
    
    trigger = _getTriggerElement(clickX, clickY);
    
    
    if (trigger != '') {
      Message.toggleMessage(room: Room.name, trigger: trigger);  
    }
    
  }
  
  static String _getTriggerElement(int clickX, int clickY) {
    String trigger = '';
    List<Item> items = Room.items;
    int itemsLength = items.length;
    
    for (int i = 0; i < itemsLength; i++) {
      Item it = items[i];
      
      if(clickY > it.posY
          && clickY < it.posY + it.height
          && clickX > it.posX
          && clickX < it.posX + it.width) {
        try {
          trigger = it.name;  
        }
        catch (e) {
          trigger = it.direction;
        }
        
        break;
      }
    }
    
    return trigger;
    
  }
  
  
  
}