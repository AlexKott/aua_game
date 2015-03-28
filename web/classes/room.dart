library Room;

import 'dart:html';
import 'roomlist.dart';


class Room {
  int _width = 800;
  int _height = 600;
  String name;
  Map items;
  
  drawRoom(CanvasRenderingContext2D context) {
    items.forEach((k, v) {
      
      int posX = items[k]['posX'];
      int posY = items[k]['posY'];
      
      
      context.fillText(k,  posX,  posY);
     
    });
  }
  
  
  Room(String roomName) {
    Map rooms = RoomList.roomList;
    this.name = roomName;
    this.items = rooms[roomName]['items'];
    }  
}






