import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

// Runs lib/farm.dart the way `dart run lib/farm.dart` does and checks what main() prints.
Future<ProcessResult> runProgram(String path) async {
  final process = await Process.start(Platform.resolvedExecutable, ['run', path]);
  await process.stdin.close();
  final out = process.stdout.transform(utf8.decoder).join();
  final err = process.stderr.transform(utf8.decoder).join();
  final code = await process.exitCode.timeout(const Duration(seconds: 90));
  return ProcessResult(process.pid, code, await out, await err);
}

void main() {
  group('main() in lib/farm.dart', () {
    test('lib/farm.dart exists and declares main()', () {
      final file = File('lib/farm.dart');
      expect(file.existsSync(), isTrue, reason: 'Keep your program in lib/farm.dart.');
      expect(file.readAsStringSync(), matches(RegExp(r'\bmain\s*\(')),
          reason: 'lib/farm.dart needs a main() function so `dart run` can start it.');
    });

    test('runs without error and prints the student and the farm', () async {
      final result = await runProgram('lib/farm.dart');
      expect(result.exitCode, equals(0),
          reason: '`dart run lib/farm.dart` must finish without an error.\n${result.stderr}');
      final output = result.stdout as String;
      expect(output, contains('Ana'), reason: 'Print the student you made.');
      expect(output, contains('Rex says Woof'));
      expect(output, contains('Tom says Meow'));
      expect(output, contains('Bessie says Moo'));
    }, timeout: const Timeout(Duration(minutes: 2)));
  });
}
