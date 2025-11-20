
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/features/emergency_contacts/providers/emergency_contact_provider.dart';
import 'package:emergen_sync/src/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmergencyContactProvider(),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'EmergenSync',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
