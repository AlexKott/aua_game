library Canvas;

import 'dart:html';

abstract class Canvas {
  
  static CanvasRenderingContext2D _context;
  
  static get context {
    return _context;
  }
  
  static create() {
    DivElement main = querySelector('#main');
    CanvasElement canvas = new CanvasElement(width: 600, height: 400);
    _context = canvas.context2D;
    main.append(canvas);
  } 
}