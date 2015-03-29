library Room;

import 'dart:html';
import 'gamedata.dart';
import 'furniture.dart';
import 'gadget.dart';
import 'door.dart';
import 'canvas.dart';


class Room {
  String name;
  Map roomItems;
  List<Furniture> furniture = new List<Furniture>();
  List<Gadget> gadgets = new List<Gadget>();
  List<Door> doors = new List<Door>();
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
    
    // fill up with doors
    if (roomItems.containsKey('doors')) {
      int doorsLength = roomItems['doors'].length;
            
      for (int i = 0; i < doorsLength; i++) {
        var d = roomItems['doors'][i];
        doors.add(new Door(direction: d['direction'], posX: d['posX'], posY: d['posY']));
      }
      
    }
    
    drawRoom(Canvas.context);
    
  }
  
  
  drawRoom(CanvasRenderingContext2D context) {
    int furnitureLength = furniture.length;
    int gadgetsLength = gadgets.length;
    int doorsLength = doors.length;
    
    for (int i = 0; i < furnitureLength; i++) {
      Furniture f = furniture[i];
      
      context.strokeRect(f.posX, f.posY, f.width, f.height);
      
    }
    for (int j = 0; j < gadgetsLength; j++) {
      Gadget g = gadgets[j];
      
      context.strokeRect(g.posX, g.posY, g.width, g.height);
      
    }
    for (int k = 0; k < doorsLength; k++) {
      Door d = doors[k];
     
      context.strokeRect(d.posX, d.posY, d.width, d.height);
    }
  }
  
  Room(String roomName) {
    this.name = roomName;
    this.roomItems = rooms[roomName]['items'];
    this.decorateRoom();
    
    }  
}






