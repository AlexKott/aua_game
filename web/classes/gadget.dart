library Gadget;

import 'item.dart';

class Gadget extends Item {
  String name;
  String color;
  List messages;
  
  
  Gadget({String this.name, int posX, int posY}) : super(posX, posY);
  
}