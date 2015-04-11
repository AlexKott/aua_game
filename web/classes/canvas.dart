library Canvas;

import 'dart:html';
import 'message.dart';
import 'room.dart';
import 'item.dart';
import 'door.dart';

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
    List<Item> items = Room.items;
    int itemsLength = items.length;
    
    // TODO: if no element was clicked, check if message is active,
    // if message is active, hide message
    // TODO: if message active && message == choice
    // check which choice was clicked. do not fall back to items!
    
    for (int i = 0; i < itemsLength; i++) {
      Item it = items[i];
      
      if(clickY > it.posY
          && clickY < it.posY + it.height
          && clickX > it.posX
          && clickX < it.posX + it.width) {
        
        if(it is Door) {
          Room.setRoom(it.direction);
          break;
        }
        
        else {
          Message.toggleMessage(room: Room.name, trigger: it.name);
          break;
        }
      }
    }
  }
}