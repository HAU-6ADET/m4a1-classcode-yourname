import 'dart:io';

import 'package:m4a1/student.dart';
import 'package:test/test.dart';

void main() {
  group('Student', () {
    test('the grade is kept in a private field', () {
      final source = File('lib/student.dart').readAsStringSync();
      expect(source, matches(RegExp(r'\b_grade\b')),
          reason: 'Store the grade in a private field named _grade.');
      expect(source, isNot(matches(RegExp(r'^\s*(final\s+)?(double|num|int|var)\s+grade\s*(=|;)', multiLine: true))),
          reason: 'A public grade field lets any code skip the getter and setter.');
    });

    test('the class has a getter and a setter named grade', () {
      final source = File('lib/student.dart').readAsStringSync();
      expect(source, matches(RegExp(r'double\s+get\s+grade')), reason: 'Add a getter named grade.');
      expect(source, matches(RegExp(r'set\s+grade\s*\(')), reason: 'Add a setter named grade.');
    });

    test('a student keeps the name, starts at a grade of 0, and shows both in toString', () {
      final s = Student('Ana');
      expect(s.name, equals('Ana'));
      expect(s.grade, equals(0));
      s.grade = 92;
      expect(s.grade, equals(92));
      final text = s.toString();
      expect(text, contains('Ana'));
      expect(text, contains('92'));
    });
  });
}
