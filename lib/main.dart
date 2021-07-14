import 'package:desktop_app/providers/screens.dart';
import 'package:desktop_app/providers/timing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen/main_screen.dart';
import 'package:flutter_cube/flutter_cube.dart';
// import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Screens(),
          ),
          ChangeNotifierProvider.value(
            value: Timeline(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
