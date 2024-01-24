import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_4/config/router/app_router.dart';

import 'providers/players_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamProvider(),
      child: MaterialApp.router(
        title: 'Ejemplo Provider 2024',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme:
            ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green[800]),
      ),
    );
  }
}
