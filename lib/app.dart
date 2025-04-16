/// 應用程式主配置文件
/// 
/// 此文件定義了應用程式的：
/// 1. 主題配置
/// 2. 導航結構
/// 3. 全局樣式
/// 
/// 主要功能：
/// 1. 設置應用程式標題
/// 2. 配置 Material Design 主題
/// 3. 設置主導航器作為首頁

import 'package:flutter/material.dart';
import 'screens/screens.dart';

class ActivitySocialApp extends StatelessWidget {
  const ActivitySocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 應用程式標題
      title: 'Activity Social',
      
      // 主題配置
      theme: ThemeData(
        // 主色調
        primarySwatch: Colors.blue,
        // 使用 Material 3 設計
        useMaterial3: true,
        // 設置背景顏色
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      
      // 設置主導航器作為首頁
      home: const MainNavigator(),
    );
  }
}