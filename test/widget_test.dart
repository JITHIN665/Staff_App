import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:staff_app/main.dart';

void main() {
  testWidgets('App starts and shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: StaffApp()));

    // Verify that the splash screen is displayed
    expect(find.text('Staff App'), findsOneWidget);
    expect(find.text('Staff Management System'), findsOneWidget);
  });
}