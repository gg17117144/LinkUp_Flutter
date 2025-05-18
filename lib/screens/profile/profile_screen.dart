/// 個人資料頁面
/// 
/// 此頁面用於顯示和管理用戶的個人資料，包含以下主要部分：
/// 1. 用戶基本信息（頭像、名稱、電子郵件）
/// 2. 活動統計（主辦活動數、參加活動數、關注數）
/// 3. 興趣標籤
/// 4. 功能按鈕（編輯資料、通知、幫助、登出）
/// 
/// 主要功能：
/// 1. 展示用戶的基本信息和統計數據
/// 2. 顯示用戶的興趣標籤
/// 3. 提供個人資料管理功能
/// 4. 支持登出操作
/// 
/// 界面特點：
/// 1. 使用卡片式設計展示各類信息
/// 2. 清晰的視覺層次和分區
/// 3. 直觀的操作入口

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/user_service.dart';
import '../../models/user.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _userService = UserService();
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      final user = await _userService.getUser(firebaseUser.uid);
      if (mounted) {
        setState(() {
          _currentUser = user;
        });
      }
    }
  }

  Future<void> _logout() async {
    try {
      await auth.FirebaseAuth.instance.signOut();
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('登出失敗')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      // 設置頁面標題和設置按鈕
      appBar: AppBar(
        title: const Text('個人資料'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      // 使用 ListView 支持滾動
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 用戶頭像
          CircleAvatar(
            radius: 50,
            backgroundImage: _currentUser!.avatarUrl != null
                ? NetworkImage(_currentUser!.avatarUrl!)
                : null,
            child: _currentUser!.avatarUrl == null
                ? const Icon(Icons.person, size: 50)
                : null,
          ),
          const SizedBox(height: 16),
          // 用戶名稱
          Text(
            _currentUser!.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // 用戶電子郵件
          Text(
            _currentUser!.email,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          // 用戶簡介
          if (_currentUser!.bio != null) ...[
            Text(
              _currentUser!.bio!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
          ],
          // 統計數據行
          _buildStatsRow(),
          const SizedBox(height: 24),
          // 興趣標籤
          _buildInterestTags(),
          const SizedBox(height: 24),
          // 功能按鈕列表
          _buildActionButtons(),
        ],
      ),
    );
  }

  /// 構建統計數據行
  /// 
  /// 顯示用戶的活動統計數據，包括：
  /// - 主辦的活動數量
  /// - 參加的活動數量
  /// - 關注的用戶數量
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('主辦活動', _currentUser!.hostingEventCount.toString()),
        _buildStatItem('參加活動', _currentUser!.participatingEventCount.toString()),
        _buildStatItem('關注', _currentUser!.followingCount.toString()),
      ],
    );
  }

  /// 構建單個統計項
  /// 
  /// @param label 統計項標籤
  /// @param value 統計值
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  /// 構建興趣標籤
  /// 
  /// 使用 Wrap 和 Chip 組件展示用戶的興趣標籤
  Widget _buildInterestTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _currentUser!.interests.map((interest) {
        return Chip(
          label: Text(interest),
          backgroundColor: Colors.blue[100],
        );
      }).toList(),
    );
  }

  /// 構建功能按鈕列表
  /// 
  /// 包含以下功能按鈕：
  /// 1. 編輯個人資料
  /// 2. 通知設置
  /// 3. 幫助與支持
  /// 4. 登出
  Widget _buildActionButtons() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('編輯個人資料'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to edit profile
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('通知設置'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to notifications
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('幫助與支持'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to help
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text(
            '登出',
            style: TextStyle(color: Colors.red),
          ),
          onTap: _logout,
        ),
      ],
    );
  }
}