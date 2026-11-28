import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hernandez_mobprog/constants.dart';
import 'package:hernandez_mobprog/data/dummy_data.dart';
import 'package:hernandez_mobprog/main.dart';
import 'package:hernandez_mobprog/widgets/notification_card.dart';

Finder _appBarText(String text) =>
    find.descendant(of: find.byType(AppBar), matching: find.text(text));

void main() {
  test('dummy data has 10 posts and 20 notifications', () {
    expect(posts.length, 10);
    expect(notifications.length, 20);
  });

  test('formatDate and formatCount', () {
    final now = DateTime(2026, 11, 28, 12);
    expect(formatDate(now.subtract(const Duration(minutes: 5)), now: now), '5m');
    expect(formatDate(now.subtract(const Duration(hours: 3)), now: now), '3h');
    expect(formatDate(DateTime(2026, 11, 3), now: now), 'November 3, 2026');
    expect(formatCount(999), '999');
    expect(formatCount(1200), '1.2K');
    expect(formatCount(3000), '3K');
  });

  testWidgets('AppBar title changes with the bottom navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    expect(_appBarText(appName), findsOneWidget);
    expect(find.text('Steve Rogers'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.notifications));
    await tester.pumpAndSettle();
    expect(_appBarText('Notifications'), findsOneWidget);
    expect(find.byType(NotificationCard), findsWidgets);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(_appBarText('Profile'), findsOneWidget);
  });
}
