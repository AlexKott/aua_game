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
    canvas.addEventListener('mousedown', _getPosition, false);
    main.append(canvas);
  } 
  
  static _getPosition(event) {
    int clickX = event.clientX - event.currentTarget.offsetLeft;
    int clickY = event.clientY - event.currentTarget.offsetTop;
  }
}