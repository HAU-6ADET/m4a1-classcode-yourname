import 'dart:io';

import 'package:m4a1/animals.dart';
import 'package:test/test.dart';

void main() {
  group('Animal and its subclasses', () {
    test('a dog keeps its name and says Woof', () {
      expect(Dog('Rex').name, equals('Rex'));
      expect(Dog('Rex').makeSound(), equals('Woof'));
    });
    test('a cat keeps its name and says Meow', () {
      expect(Cat('Tom').name, equals('Tom'));
      expect(Cat('Tom').makeSound(), equals('Meow'));
    });
    test('a cow keeps its name and says Moo', () {
      expect(Cow('Bessie').name, equals('Bessie'));
      expect(Cow('Bessie').makeSound(), equals('Moo'));
    });

    test('a list of Animal answers with each subclass sound, and the base Animal keeps its own', () {
      final List<Animal> farm = [Dog('Rex'), Cat('Tom'), Cow('Bessie')];
      expect(farm.map((a) => a.makeSound()).toList(), equals(['Woof', 'Meow', 'Moo']));
      expect(Animal('Generic').makeSound(), equals('...'));
    });

    test('each subclass marks its method with @override', () {
      final source = File('lib/animals.dart').readAsStringSync();
      expect('@override'.allMatches(source).length, greaterThanOrEqualTo(3),
          reason: 'Dog, Cat and Cow each override makeSound() and should say so with @override.');
    });
  });
}
