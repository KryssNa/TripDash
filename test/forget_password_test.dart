import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tripdash/Screens/UserScreen/forgot_password.dart';
//import 'package:tripdash/screens/forgot_password_screen.dart';

void main() {
  group('Forgot Password', () {
    testWidgets('Forgot Password - UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(ForgotPassword());

      // Verify the presence of UI elements on the screen
      expect(find.text('Forgot Password'), findsOneWidget);
      expect(find.text('Enter your email address'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Forgot Password - Email Validation Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(ForgotPassword());

      final emailTextField = find.byType(TextField);
      final resetButton = find.byType(ElevatedButton);

      // Enter an invalid email address
      await tester.enterText(emailTextField, 'invalid_email');
      await tester.tap(resetButton);
      await tester.pump();

      // Verify if error message is shown
      expect(find.text('Invalid email address'), findsOneWidget);

      // Clear the text field
      await tester.enterText(emailTextField, '');
      await tester.tap(resetButton);
      await tester.pump();

      // Verify if error message is shown
      expect(find.text('Email address is required'), findsOneWidget);

      // Enter a valid email address
      await tester.enterText(emailTextField, 'valid_email@example.com');
      await tester.tap(resetButton);
      await tester.pump();

      // Verify if no error message is shown
      expect(find.text('Invalid email address'), findsNothing);
      expect(find.text('Email address is required'), findsNothing);
    });

    testWidgets('Forgot Password - API Request Test',
        (WidgetTester tester) async {
      // Mock the API request and response
      // Replace this with your actual API mocking code

      await tester.pumpWidget(ForgotPassword());

      final emailTextField = find.byType(TextField);
      final resetButton = find.byType(ElevatedButton);

      // Enter a valid email address
      await tester.enterText(emailTextField, 'valid_email@example.com');
      await tester.tap(resetButton);
      await tester.pump();

      // Verify if the loading indicator is shown
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Mock the API response success
      // Replace this with your actual API mocking code

      // Verify if the success message is shown
      expect(find.text('Password reset email sent'), findsOneWidget);
    });
  });
}
