/// 應用程式入口文件
/// 
/// 此文件是整個應用程式的起點，負責：
/// 1. 初始化 Flutter 框架
/// 2. 初始化 Firebase 服務
/// 3. 啟動應用程式
/// 
/// 主要流程：
/// 1. 確保 Flutter 框架已初始化
/// 2. 使用 firebase_options.dart 中的配置初始化 Firebase
/// 3. 運行 ActivitySocialApp 作為根組件

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'screens/main_navigator.dart';

void main() async {
  // 確保 Flutter 框架已初始化
  WidgetsFlutterBinding.ensureInitialized();
  
  // 使用 firebase_options.dart 中的配置初始化 Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // 運行應用程式
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasData) {
            return const MainNavigator();
          }
          
          return const LoginScreen();
        },
      ),
    );
  }
}