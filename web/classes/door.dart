library Door;

import 'item.dart';

class Door extends Item {
  String direction;
  int width = 100;
  int height = 100;
  String color;

  changeRoom() {

  }

  Door ({String direction, int posX, int posY}) : super(posX, posY) {
  
    this.direction = direction;
    this.posX = posX;
    this.posY = posY;
  }
}
