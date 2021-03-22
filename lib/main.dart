import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'View/home_page.dart';
import 'utils/extentions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          darkTheme:ThemeData(
            brightness: Brightness.dark,
            primaryColor: Theme.of(context).colorScheme.appBarColor,
            appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.appBarColor
            ),
            scaffoldBackgroundColor: Theme.of(context).colorScheme.backgroundColor
        ) ,
          home: MyHomePage(),
        ));
  }
}
