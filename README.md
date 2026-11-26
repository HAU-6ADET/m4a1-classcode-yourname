# M4A1: Student Grade Manager and Animal Sounds

**Kind:** in-lab demo. You follow along while the instructor builds it, then you push it. It is worth 5 points. Searching, AI and helping each other are allowed, because this is practice; record what you used in `SOURCES-AND-ASSISTANCE.md`.

This is week 4, object-oriented Dart. The meeting has two short builds: a `Student` class whose grade is private and reached through a getter and a setter, then an `Animal` class with subclasses that each override `makeSound()`. It is the syllabus code demo pair for the week.

## Before you start

Follow the [setup guide](SETUP.md) to create and clone your private repository, exactly as in M1A0. The repository is named `m4a1-CLASSCODE-USERNAME`.

## What to build

The starter already holds the classes you will change. Follow the demo and make these true:

- In `lib/student.dart`, the constructor takes only the name, so `Student('Ana')` is valid and the grade starts at `0`. The grade is stored in a private field named `_grade` (a number such as `double`), and a getter and a setter named `grade` reach it. `toString()` returns the name and the grade.
- In `lib/animals.dart`, `Dog`, `Cat` and `Cow` each override `makeSound()` to return `Woof`, `Meow` and `Moo`.
- In `lib/farm.dart`, `main()` makes the student `Ana` with `Student('Ana')`, sets her grade to 92 through the setter, and prints her, then loops over a `List<Animal>` holding Rex the dog, Tom the cat and Bessie the cow, and prints a line such as `Rex says Woof` for each.

Run your program with:

```sh
dart run lib/farm.dart
```

The setter accepts any value for now. That is deliberate; the take-home M4A2 is where you decide what a setter should refuse.

## Concepts to follow in the demo

- Why a field starts public and then becomes private.
- A constructor that sets a `final` field.
- What `@override` protects you from.
- A list typed as the parent class that answers with each child's behaviour.

## How it is graded

5 test points, from the tests in this repository. Every activity also checks `student.json`: fill in your full name, student number, school email, class code, GitHub username, `room` and `pcNumber`, all as text.

## Check and save your work

```sh
dart pub get
dart analyze
dart test
```

Run `dart pub get` first on a lab PC or a Mac: it downloads the test package, and `dart analyze` reports errors until it has run.

The tests in your repository are a guide. The instructor grades from the course's own copy of the tests, so do not edit the tests to make them pass.

```sh
git status
git add lib/ student.json SOURCES-AND-ASSISTANCE.md
git commit -m "Complete M4A1"
```

In VS Code, open **Source Control** and choose **Push**, then check that the commit appears on GitHub.

## Submit the exact commit link in Canvas

Open your repository's commit history on GitHub, open the commit with your finished work, copy its full URL (it contains **/commit/**), and submit it in the Canvas assignment for M4A1 using the Website URL option. Submit the commit page, not the repository home page or a screenshot.
