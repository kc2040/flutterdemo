import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdemo/main.dart';

main() {
  HomepageState _subject;

  setUp(() {
    _subject = HomepageState();
  });

  group("Login tests", () {
    test("Login should fail", () {
      final result = _subject.loginUser('usrname', '123w23');
      expect(result, false);
    });

    test("Login should pass", () {
      final result = _subject.loginUser('demo', 'demo');
      expect(result, true);
    });
  });
}
