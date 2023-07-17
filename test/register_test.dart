import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tripdash/Screens/AuthenticationScreen/register_screen.dart';
import 'package:tripdash/register_screen.dart';

void main() {
  testWidgets('Register screen test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    // Find the input fields and submit button
    final nameField = find.byKey(Key('name_field'));
    final emailField = find.byKey(Key('email_field'));
    final passwordField = find.byKey(Key('password_field'));
    final confirmPasswordField = find.byKey(Key('confirm_password_field'));
    final submitButton = find.byKey(Key('submit_button'));

    // Enter valid input values
    await tester.enterText(nameField, 'John Doe');
    await tester.enterText(emailField, 'johndoe@example.com');
    await tester.enterText(passwordField, 'password');
    await tester.enterText(confirmPasswordField, 'password');

    // Tap the submit button
    await tester.tap(submitButton);
    await tester.pump();

    // Verify that the registration was successful
    expect(find.text('Registration successful!'), findsOneWidget);
  });
}
