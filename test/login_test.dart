import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Tests', () {
    AuthService authService;

    setUp(() {
      authService = AuthService();
    });

    test('Empty email and password should return error', () {
      final result = AuthService.login('', '');
      expect(result, equals('Please enter email and password'));
    });

    test('Empty email should return error', () {
      final result = AuthService.login('', 'password');
      expect(result, equals('Please enter email'));
    });

    test('Empty password should return error', () {
      final result = AuthService.login('test@example.com', '');
      expect(result, equals('Please enter password'));
    });

    test('Valid email and password should return success', () {
      final result = AuthService.login('test@example.com', 'password');
      expect(result, equals('Success'));
    });
  });
}

class AuthService {
  String login(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      return 'Please enter email and password';
    } else if (email.isEmpty) {
      return 'Please enter email';
    } else if (password.isEmpty) {
      return 'Please enter password';
    } else {
      // Perform authentication logic here (e.g., API call to verify credentials)
      // Return 'Success' if login is successful, otherwise return appropriate error message.
      return 'Success';
    }
  }
}
