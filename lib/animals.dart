// M4A1 part 2: Animal and its subclasses. Follow the demo and override makeSound().
// Read README.md for the rules. The tests check this file.

class Animal {
  final String name;
  Animal(this.name);

  String makeSound() => '...';
}

class Dog extends Animal {
  Dog(super.name);
}

class Cat extends Animal {
  Cat(super.name);
}

class Cow extends Animal {
  Cow(super.name);
}
