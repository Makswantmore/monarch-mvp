import 'package:flutter_test/flutter_test.dart';
import 'package:monarch_mvp/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    final state = AppState();
    await state.load();

    await tester.pumpWidget(
      AppScope(
        notifier: state,
        child: const FinanceApp(),
      ),
    );

    expect(find.byType(FinanceApp), findsOneWidget);
  });
}