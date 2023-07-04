import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration test', () {
    testWidgets('Two to-do items should be added and checked', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Buy groceries');
      await tester.tap(find.text('Add'));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Attend workshop');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // first checkbox
      final checkbox1 = find.byType(Checkbox).first;

      // second checkbox
      final checkbox2 = find.byType(Checkbox).last;

      // make sure they're unchecked
      expect(tester.widget<Checkbox>(checkbox1).value, false);
      expect(tester.widget<Checkbox>(checkbox2).value, false);

      // tap the first checkbox
      await tester.tap(checkbox1);

      // tap the second checkbox
      await tester.tap(checkbox2);

      await tester.pumpAndSettle();

      expect(tester.widget<Checkbox>(checkbox1).value, true);
      expect(tester.widget<Checkbox>(checkbox2).value, true);
    });
  });
}
