/// 活動模型類
/// 
/// 此類定義了活動的基本屬性和狀態，用於在應用中表示和管理活動數據。
/// 包含活動的基本信息、參與者信息、時間信息等。
/// 
/// 主要屬性：
/// 1. 基本信息：標題、描述、地點、圖片等
/// 2. 時間信息：活動時間
/// 3. 參與者信息：主辦者、當前參與人數、最大參與人數
/// 4. 狀態信息：活動狀態
/// 
/// 主要功能：
/// 1. 提供活動數據的結構化表示
/// 2. 支持活動狀態的判斷和轉換
/// 3. 提供參與者管理的基礎功能

import 'package:flutter/material.dart';

/// 活動狀態枚舉
/// 
/// 定義活動可能處於的不同狀態：
/// - registrationOpen: 報名開放中
/// - registrationClosed: 報名已關閉
/// - ongoing: 正在進行
/// - completed: 已完成
/// - cancelled: 已取消
enum EventStatus {
  registrationOpen,
  registrationClosed,
  ongoing,
  completed,
  cancelled
}

/// 活動模型類
class Event {
  /// 活動唯一標識符
  final String id;

  /// 活動標題
  final String title;

  /// 活動描述
  final String description;

  /// 活動地點
  final String location;

  /// 活動時間
  final DateTime dateTime;

  /// 最大參與人數
  final int maxParticipants;

  /// 當前參與人數
  final int currentParticipants;

  /// 活動主辦者ID
  final String hostId;

  /// 活動主辦者名稱
  final String hostName;

  /// 活動圖片URL
  final String imageUrl;

  /// 活動類別
  final String category;

  /// 活動狀態
  final EventStatus status;

  /// 構造函數
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.dateTime,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.hostId,
    required this.hostName,
    required this.imageUrl,
    required this.category,
    required this.status,
  });

  /// 檢查活動是否已額滿
  bool get isFull => currentParticipants >= maxParticipants;

  /// 檢查活動是否可加入
  bool get canJoin => status == EventStatus.registrationOpen && !isFull;

  /// 獲取活動狀態文本
  String get statusText {
    switch (status) {
      case EventStatus.registrationOpen:
        return isFull ? '已額滿' : '報名中';
      case EventStatus.registrationClosed:
        return '報名截止';
      case EventStatus.ongoing:
        return '進行中';
      case EventStatus.completed:
        return '已結束';
      case EventStatus.cancelled:
        return '已取消';
    }
  }

  /// 獲取活動狀態對應的顏色
  Color get statusColor {
    switch (status) {
      case EventStatus.registrationOpen:
        return isFull ? Colors.red : Colors.green;
      case EventStatus.registrationClosed:
        return Colors.orange;
      case EventStatus.ongoing:
        return Colors.blue;
      case EventStatus.completed:
        return Colors.grey;
      case EventStatus.cancelled:
        return Colors.red;
    }
  }
} 