library RoomList;

import 'dart:html';
import 'dart:convert';

abstract class RoomList {
  static Map _rooms = new Map();
  
  static get roomList {
    if (_rooms.isEmpty) {
       _getRoomList((rooms) {
         _rooms = rooms;
       });
       return _rooms;
    }
    else {
      return _rooms;
    }
  }
  
  static _getRoomList(callback(rooms)) {
      HttpRequest xhr = new HttpRequest();
      xhr.open('GET', 'content/rooms.json', async: false);
      xhr.onReadyStateChange.listen((e) {
        if (xhr.readyState == HttpRequest.DONE && xhr.status == 200) {
          Map rooms = JSON.decode(e.target.response);
          callback(rooms);
        }
      });
      xhr.onError.listen((e) => window.alert('ERROR'));
      xhr.send();
    }
}