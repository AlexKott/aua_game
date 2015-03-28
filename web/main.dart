// Copyright (c) 2015, Alex Kott and Alina Beck. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'classes/room.dart';

void main() {
  DivElement main = querySelector('#main');
  CanvasElement canvas = new CanvasElement(width: 800, height: 600);
  CanvasRenderingContext2D context = canvas.context2D;
  main.append(canvas);
  Room current = new Room('kitchen');
  current.drawRoom(context);
}


