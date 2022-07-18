import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/screens/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: GlobalVaraibles.greyBackgroundCOlor,
        iconTheme: const IconThemeData(
          color: GlobalVaraibles.secondaryColor,
        ),
        colorScheme: const ColorScheme.light(
          primary: GlobalVaraibles.secondaryColor,
          secondary: GlobalVaraibles.secondaryColor,
          surface: GlobalVaraibles.backgroundColor,
          onSurface: GlobalVaraibles.backgroundColor,
          background: GlobalVaraibles.backgroundColor,
          error: GlobalVaraibles.secondaryColor,
          onError: GlobalVaraibles.secondaryColor,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: MyHomePage.routeName,
      routes: routes,
    );
  }
}
