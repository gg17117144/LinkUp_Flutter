import 'package:flutter/material.dart';
import 'screens/screens.dart';

class ActivitySocialApp extends StatelessWidget {
  const ActivitySocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Social',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MainNavigator(),
    );
  }
}