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
import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      avatarUrl: data['avatarUrl'],
      bio: data['bio'],
      hostingEventIds: List<String>.from(data['hostingEventIds'] ?? []),
      participatingEventIds: List<String>.from(data['participatingEventIds'] ?? []),
      followingIds: List<String>.from(data['followingIds'] ?? []),
      followerIds: List<String>.from(data['followerIds'] ?? []),
      interests: List<String>.from(data['interests'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'bio': bio,
      'hostingEventIds': hostingEventIds,
      'participatingEventIds': participatingEventIds,
      'followingIds': followingIds,
      'followerIds': followerIds,
      'interests': interests,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
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