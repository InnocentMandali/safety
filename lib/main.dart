
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/features/authentication/data/auth_repository.dart';
import 'src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'src/features/authentication/presentation/bloc/auth_event.dart';
import 'src/features/emergency_contacts/providers/emergency_contact_provider.dart';
import 'src/features/theme/theme_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthRepository>(),
            )..add(const AuthEvent.appStarted()),
          ),
          ChangeNotifierProvider(
            create: (context) => EmergencyContactProvider(),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const EmergenSyncApp(),
        ),
      ),
    ),
  );
}
