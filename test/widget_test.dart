import 'package:flutter_test/flutter_test.dart';
import 'package:block_with_flutter/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Just verify app builds without crashing
    expect(find.byType(MyApp), findsOneWidget);
  });
}