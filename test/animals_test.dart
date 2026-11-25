import 'dart:io';

import 'package:m4a1/animals.dart';
import 'package:test/test.dart';

void main() {
  group('Animal and its subclasses', () {
    test('every animal keeps its name', () {
      expect(Dog('Rex').name, equals('Rex'));
      expect(Cat('Tom').name, equals('Tom'));
      expect(Cow('Bessie').name, equals('Bessie'));
    });

    test('a dog says Woof', () => expect(Dog('Rex').makeSound(), equals('Woof')));
    test('a cat says Meow', () => expect(Cat('Tom').makeSound(), equals('Meow')));
    test('a cow says Moo', () => expect(Cow('Bessie').makeSound(), equals('Moo')));

    test('the base Animal keeps its own sound', () {
      expect(Animal('Generic').makeSound(), equals('...'));
    });

    test('a list of Animal answers with each subclass sound', () {
      final List<Animal> farm = [Dog('Rex'), Cat('Tom'), Cow('Bessie')];
      expect(farm.map((a) => a.makeSound()).toList(), equals(['Woof', 'Meow', 'Moo']));
    });

    test('each subclass marks its method with @override', () {
      final source = File('lib/animals.dart').readAsStringSync();
      expect('@override'.allMatches(source).length, greaterThanOrEqualTo(3),
          reason: 'Dog, Cat and Cow each override makeSound() and should say so with @override.');
    });
  });
}
