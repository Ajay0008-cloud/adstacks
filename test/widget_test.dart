import 'package:flutter_test/flutter_test.dart';
import 'package:adstacks/main.dart';

void main() {
  testWidgets('AdStacks dashboard smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AdStacksApp());
    expect(find.text('Top Rating Project'), findsOneWidget);
  });
}
