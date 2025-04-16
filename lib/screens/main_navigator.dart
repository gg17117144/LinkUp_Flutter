/// 主導航器組件
/// 
/// 此組件負責管理應用程式的主要導航結構，包括：
/// 1. 底部導航欄
/// 2. 屏幕切換邏輯
/// 3. 狀態管理
/// 
/// 主要功能：
/// 1. 提供四個主要頁面的導航：
///    - 首頁 (Home)
///    - 活動頁面 (Events)
///    - 聊天頁面 (Chat)
///    - 個人資料頁面 (Profile)
/// 2. 使用 IndexedStack 實現頁面切換
/// 3. 管理當前選中的頁面索引

import 'package:flutter/material.dart';
import 'screens.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  /// 當前選中的頁面索引
  int _currentIndex = 0;

  /// 所有頁面組件的列表
  final List<Widget> _screens = [
    const HomeScreen(),
    const EventsScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用 IndexedStack 實現頁面切換
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      // 底部導航欄
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          // 首頁導航項
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          // 活動頁面導航項
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Events',
          ),
          // 聊天頁面導航項
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          // 個人資料頁面導航項
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}