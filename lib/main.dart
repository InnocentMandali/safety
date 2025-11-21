
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:emergen_sync/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/core/routing/app_router.dart';
import 'package:emergen_sync/src/features/emergency_contacts/providers/emergency_contact_provider.dart';
import 'package:emergen_sync/providers/task_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          ChangeNotifierProvider(
              create: (context) => EmergencyContactProvider()),
          ChangeNotifierProvider(create: (context) => TaskProvider()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'EmergenSync',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
