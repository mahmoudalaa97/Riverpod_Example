import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';
import 'utils/extentions.dart';

/// Main Method
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase initialization.
  Firebase.initializeApp();
  runApp(MainApp());
}

/// MainApp Include Everything need to run like:
/// [ ProviderScope] A widget that stores the state of providers.
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Theme.of(context).colorScheme.appBarColor,
          appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.appBarColor),
          scaffoldBackgroundColor:
              Theme.of(context).colorScheme.backgroundColor),
      home: MyHomePage(),
    ));
  }
}
