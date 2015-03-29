library Room;

import 'dart:html';
import 'gamedata.dart';
import 'furniture.dart';
import 'gadget.dart';


class Room {
  String name;
  Map roomItems;
  List<Furniture> furniture = new List<Furniture>();
  List<Gadget> gadgets = new List<Gadget>();
  Map rooms = GameData.rooms;
  
  
  decorateRoom() {
    
    // fill up with furniture
    if (roomItems.containsKey('furniture')) {
      roomItems['furniture'].forEach((k, v) {
        furniture.add(new Furniture(name: k, posX: v['posX'], posY: v['posY']));
      });
    }
    
    // fill up with gadgets
    if (roomItems.containsKey('gadgets')) {
      roomItems['gadgets'].forEach((k, v) {
        gadgets.add(new Gadget(name: k, posX: v['posX'], posY: v['posY']));
      });
    }
    
    print(furniture);
    print(gadgets);
    
  }
  
  
  drawRoom(CanvasRenderingContext2D context) {
    roomItems.forEach((k, v) {
      
      int posX = roomItems[k]['posX'];
      int posY = roomItems[k]['posY'];
      
      
      context.fillText(k,  posX,  posY);
     
    });
  }
  
  Room(String roomName) {
    this.name = roomName;
    this.roomItems = rooms[roomName]['items'];
    this.decorateRoom();
    
    }  
}






