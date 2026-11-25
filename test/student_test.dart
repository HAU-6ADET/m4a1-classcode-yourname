import 'dart:io';

import 'package:m4a1/student.dart';
import 'package:test/test.dart';

void main() {
  group('Student', () {
    test('a new student has the name given and a grade of 0', () {
      final s = Student('Ana');
      expect(s.name, equals('Ana'));
      expect(s.grade, equals(0));
    });

    test('the grade can be set and read back', () {
      final s = Student('Ana');
      s.grade = 92.5;
      expect(s.grade, equals(92.5));
    });

    test('the grade is kept in a private field', () {
      final source = File('lib/student.dart').readAsStringSync();
      expect(source, matches(RegExp(r'double\s+_grade')),
          reason: 'Store the grade in a private field named _grade.');
      expect(source, isNot(matches(RegExp(r'double\s+grade\s*(=|;)'))),
          reason: 'A public grade field lets any code skip the getter and setter.');
    });

    test('the class has a getter and a setter named grade', () {
      final source = File('lib/student.dart').readAsStringSync();
      expect(source, matches(RegExp(r'double\s+get\s+grade')), reason: 'Add a getter named grade.');
      expect(source, matches(RegExp(r'set\s+grade\s*\(')), reason: 'Add a setter named grade.');
    });

    test('toString shows the name and the grade', () {
      final s = Student('Ana');
      s.grade = 92;
      final text = s.toString();
      expect(text, contains('Ana'));
      expect(text, contains('92'));
    });
  });
}
