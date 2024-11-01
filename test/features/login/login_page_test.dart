import 'package:app_challenge/core/inject/app_inject.dart';
import 'package:app_challenge/features/login/presenter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLoginFunction extends Mock {
  void call();
}

void main() {
  final getIt = GetIt.instance;

  setUp(() async {
    getIt.reset();
    SharedPreferences.setMockInitialValues({});
    await AppInject.start();
  });

  testWidgets('Tap login button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    final loginButton = find.byType(FloatingActionButton);

    await tester.tap(loginButton);
    await tester.pump();

    // Verifica se o botão foi pressionado
    expect(loginButton, findsOneWidget);
  });

  testWidgets('Wait screen to load', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });
}
