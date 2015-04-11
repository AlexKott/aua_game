import 'package:unittest/unittest.dart';

import 'classes/choice.dart';


void testrunner() {
  group('Choice tests', () {
    test('choiceRange initialised', () {
      expect(Choice.choiceRange.length, equals(0));
    });
    test('get choice method', () {
      expect(Choice.getChoices is Function, equals(true));
    });
  });
}