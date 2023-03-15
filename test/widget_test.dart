// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pomodoro/screens/Pomodoro.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

void main() {
  late Widget myApp;

  setUpAll(() {
    myApp = MultiProvider(
      providers: [
        Provider<PomodoroStore>(create: (_) => PomodoroStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Pomodoro(),
      ),
    );
  });

  tearDownAll(() {
    // This is run once after all tests, and is a good place to put
    // one-time teardown code that will be run after every test.
  });

  setUp(() {
    // This is run before each test, and is a good place to put
    // per-test setup code that will be run before each test.
  });

  tearDown(() async {
    // This is run after each test, and is a good place to put
    // per-test teardown code that will be run after each test.
  });

  testWidgets('Pomodoro smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(myApp);

    // Exemplo de teste para verificar se o widget está em tela
    expect(find.text('25:00'), findsOneWidget);
    expect(find.text('Iniciar'), findsOneWidget);
    expect(find.text('Reiniciar'), findsOneWidget);

    expect(find.byType(ElevatedButton), findsNWidgets(6));

    final regex = RegExp('Vamos nessa');
    expect(find.textContaining(regex), findsOneWidget);
    expect(find.text('Vamos nessa ${String.fromCharCode(0x1F680)}'), findsOneWidget);

    // Exemplo de como simular uma interação com o widget
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump(const Duration(milliseconds: 1000));

    // Exemplo de como verificar se o widget foi alterado
    expect(find.text('Iniciar'), findsNothing);
    expect(find.text('Parar'), findsOneWidget);
    expect(find.text('25:00'), findsNothing);
    expect(find.text('24:59'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.stop));
    await tester.pump();

    expect(find.text('Parar'), findsNothing);
    expect(find.text('Reiniciar'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('25:00'), findsOneWidget);
  });
}
