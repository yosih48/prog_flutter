import 'package:flutter/material.dart';
import 'package:rest_api/Screens/UserListScreen.dart';

class AppStarter extends StatelessWidget {
  const AppStarter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserListScreen(),
    );
  }
}
