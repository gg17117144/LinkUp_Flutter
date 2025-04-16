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
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  // 確保 Flutter 框架已初始化
  WidgetsFlutterBinding.ensureInitialized();
  
  // 使用 firebase_options.dart 中的配置初始化 Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // 運行應用程式，使用 ActivitySocialApp 作為根組件
  runApp(const ActivitySocialApp());
}