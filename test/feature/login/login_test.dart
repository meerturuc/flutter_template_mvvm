import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {
    print('Here');
  });
  // Service Test denemeleri
  test('User Login Fail Test', () {
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });
// Birden fazla servisi test denemeleri
  group('User Login Full Test', () {
// Test 1
    test('User Login Fail Test', () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    // Test 2
    test('User Login Fail Test', () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    // Test 3
    test('User Login Fail Test', () {
      final isUserLogin = true;

      expect(isUserLogin, isTrue);
    });
  });
}
