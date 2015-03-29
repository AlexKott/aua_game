library GameData;

import 'dart:html';
import 'dart:convert';

abstract class GameData {
  
  static Map _rooms = new Map();
  static Map _items = new Map();
  static Map _messages = new Map();
  
  static get rooms {
    return _rooms;
  }
  
  static get items {
    return _items;
  }
  
  static get messages {
    return _messages;
  }
  
  static initialise() {
    DivElement status = querySelector('#status');
    status.text = 'Building your house ...';
    
    _getData('rooms', (roomsData) {
      status.text = 'Decorating rooms ...';
      _rooms = roomsData;
    });
    
    _getData('items', (itemsData) {
      status.text = 'Predicting the future ...';      
      _items = itemsData;
    });
    
    _getData('messages', (messagesData) {
      status.text = 'Done!';
      status.text = '';
      _messages = messagesData;
    });
   }
  
  
  static _getData (String mapName, callback(data)) {
    HttpRequest xhr = new HttpRequest();
    xhr.open('GET', 'content/$mapName.json', async: false);
    xhr.onReadyStateChange.listen((e) {
      if (xhr.readyState == HttpRequest.DONE && xhr.status == 200) {
        Map data = JSON.decode(e.target.response);
        callback(data);
      }
    });
    xhr.onError.listen((e) => window.alert('ERROR'));
    xhr.send();
  }
  
  
}