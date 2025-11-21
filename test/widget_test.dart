
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:emergen_sync/src/app.dart';
import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:emergen_sync/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:emergen_sync/src/features/theme/theme_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(context.read<AuthRepository>()),
            ),
          ],
          child: ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: const EmergenSyncApp(),
          ),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
  });
}
