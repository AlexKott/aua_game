library Room;

import 'dart:html';
import 'gamedata.dart';
import 'item.dart';
import 'furniture.dart';
import 'gadget.dart';
import 'door.dart';
import 'canvas.dart';


abstract class Room {
  static String _name;
  static Map _roomItems;
  static List<Item> _items = new List<Item>();
  static Map _rooms = GameData.rooms;
  
  
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
  
    
    _drawRoom(Canvas.context);
    
  }
  
  
  static _drawRoom(CanvasRenderingContext2D context) {
    int itemsLength = _items.length;
    
    for (int i = 0; i < itemsLength; i++) {
      Item it = _items[i];
      
      context.strokeRect(it.posX, it.posY, it.width, it.height);
    }
  }
  
  static setRoom(String roomName) {
    _name = roomName;
    _roomItems = _rooms[roomName]['items'];
    _decorateRoom();
    
    }  
}






