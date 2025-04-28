/// 用戶模型類
/// 
/// 此類定義了用戶的基本屬性和狀態，用於在應用中表示和管理用戶數據。
/// 包含用戶的基本信息、活動參與情況、社交關係等。
/// 
/// 主要屬性：
/// 1. 基本信息：ID、名稱、電子郵件、頭像等
/// 2. 活動信息：主辦的活動、參加的活動
/// 3. 社交信息：關注的用戶、粉絲
/// 4. 偏好設置：興趣標籤、通知設置等
/// 
/// 主要功能：
/// 1. 提供用戶數據的結構化表示
/// 2. 管理用戶的活動參與情況
/// 3. 處理用戶的社交關係
/// 4. 管理用戶的偏好設置

import 'package:flutter/material.dart';

/// 用戶模型類
class User {
  /// 用戶唯一標識符
  final String id;

  /// 用戶名稱
  final String name;

  /// 用戶電子郵件
  final String email;

  /// 用戶頭像URL
  final String? avatarUrl;

  /// 用戶簡介
  final String? bio;

  /// 用戶主辦的活動ID列表
  final List<String> hostingEventIds;

  /// 用戶參加的活動ID列表
  final List<String> participatingEventIds;

  /// 用戶關注的用戶ID列表
  final List<String> followingIds;

  /// 用戶的粉絲ID列表
  final List<String> followerIds;

  /// 用戶的興趣標籤
  final List<String> interests;

  /// 用戶創建時間
  final DateTime createdAt;

  /// 用戶最後更新時間
  final DateTime updatedAt;

  /// 構造函數
  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.bio,
    required this.hostingEventIds,
    required this.participatingEventIds,
    required this.followingIds,
    required this.followerIds,
    required this.interests,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 從JSON創建用戶實例
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      hostingEventIds: List<String>.from(json['hostingEventIds'] as List),
      participatingEventIds: List<String>.from(json['participatingEventIds'] as List),
      followingIds: List<String>.from(json['followingIds'] as List),
      followerIds: List<String>.from(json['followerIds'] as List),
      interests: List<String>.from(json['interests'] as List),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// 將用戶實例轉換為JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'bio': bio,
      'hostingEventIds': hostingEventIds,
      'participatingEventIds': participatingEventIds,
      'followingIds': followingIds,
      'followerIds': followerIds,
      'interests': interests,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 獲取用戶主辦的活動數量
  int get hostingEventCount => hostingEventIds.length;

  /// 獲取用戶參加的活動數量
  int get participatingEventCount => participatingEventIds.length;

  /// 獲取用戶關注的用戶數量
  int get followingCount => followingIds.length;

  /// 獲取用戶的粉絲數量
  int get followerCount => followerIds.length;

  /// 檢查用戶是否主辦了指定活動
  bool isHostingEvent(String eventId) => hostingEventIds.contains(eventId);

  /// 檢查用戶是否參加了指定活動
  bool isParticipatingEvent(String eventId) => participatingEventIds.contains(eventId);

  /// 檢查用戶是否關注了指定用戶
  bool isFollowing(String userId) => followingIds.contains(userId);

  /// 獲取用戶的默認頭像
  Widget get defaultAvatar {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[300],
      child: Icon(
        Icons.person,
        size: 30,
        color: Colors.grey[600],
      ),
    );
  }
} 