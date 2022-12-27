import 'package:calculator/home_layout/home_screen.dart';
import 'package:calculator/provider/main_provider.dart';
import 'package:calculator/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MainProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (c) => HomeScreen(),
      },
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: mainProvider.currentThemeMode,
    );
  }
}
