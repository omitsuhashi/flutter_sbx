// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sbx/apps/countdown_rp/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Use `Future.delayed` certainly
    await tester.runAsync(() async {
      await tester.pumpWidget(
          const ProviderScope(child: MaterialApp(home: CountDownRPPage())));

      expect(find.text('00:01:00'), findsOneWidget);

      await tester.tap(find.byKey(const Key('start')));

      await tester.pump();

      await Future.delayed(const Duration(seconds: 1), () async {
        await tester.tap(find.byKey(const Key('pause')));
      });

      await tester.pump();

      expect(find.text('00:00:59'), findsOneWidget);
    });
  });
}
