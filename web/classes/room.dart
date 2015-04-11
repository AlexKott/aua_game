library Room;

import 'gamedata.dart';
import 'item.dart';
import 'furniture.dart';
import 'gadget.dart';
import 'door.dart';
import 'canvas.dart';
import 'message.dart';


abstract class Room {
  static String _name;
  static Map _roomItems;
  static List<Item> _items = new List<Item>();
  static Map _rooms = GameData.rooms;
  
  static get name {
    return _name;
  }
  
  static get items {
    return _items;
  }
  
  static _decorateRoom() {
    
    // fill up with furniture
    if (_roomItems.containsKey('furniture')) {
      _roomItems['furniture'].forEach((k, v) {
        _items.add(new Furniture(name: k, posX: v['posX'], posY: v['posY']));
      });
    }
    
    // fill up with gadgets
    if (_roomItems.containsKey('gadgets')) {
      _roomItems['gadgets'].forEach((k, v) {
        _items.add(new Gadget(name: k, posX: v['posX'], posY: v['posY']));
      });
    }
    
    // fill up with doors
    if (_roomItems.containsKey('doors')) {
      _roomItems['doors'].forEach((k, v) {
        _items.add(new Door(direction: k, posX: v['posX'], posY: v['posY']));
      });
    }
  
    
    _drawRoom();
    
  }
  
  
  static _drawRoom() {
    int itemsLength = _items.length;
    
    for (int i = 0; i < itemsLength; i++) {
      Item it = _items[i];
      
      Canvas.context.strokeRect(it.posX, it.posY, it.width, it.height);
    }
  }
  
  static _clearRoom() {
    Canvas.context.clearRect(0, 0, 600, 400);
  }
  
  static reDrawRoom() {
    _clearRoom();
    _drawRoom();
  }
  
  static setRoom(String roomName) {
    // TODO: check if room is accessible
    _clearRoom();
    _items.clear();
    _name = roomName;
    _roomItems = _rooms[roomName]['items'];
    _decorateRoom();
  }
  
  static roomAction(int clickX, int clickY) {
    
    int itemsLength = items.length;
    
    for (int i = 0; i < itemsLength; i++) {
      Item it = items[i];
      
      if(clickY > it.posY
          && clickY < it.posY + it.height
          && clickX > it.posX
          && clickX < it.posX + it.width) {
        
        // TODO: check gamestate changers for clicked item
        
        if(it is Door) {
          
          // TODO: check if door is accessible
          Room.setRoom(it.direction);
          break;
        }
        
        else {
          Message.toggleMessage(room: _name, trigger: it.name);
          break;
        }
      }
    }
  }
  
  
}






