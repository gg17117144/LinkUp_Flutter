/// Mock 數據
/// 
/// 此文件包含用於開發和測試的模擬數據。
/// 包括用戶數據、活動數據等。

import 'package:flutter/material.dart';
import 'user.dart';
import 'event.dart';

/// 當前登錄用戶的模擬數據
final User currentUser = User(
  id: 'user1',
  name: '王小明本地測試',
  email: 'xiaoming@example.com',
  avatarUrl: 'https://picsum.photos/200?random=1',
  bio: '熱愛戶外活動和攝影，喜歡結交新朋友！',
  hostingEventIds: ['event1', 'event2'],
  participatingEventIds: ['event3', 'event4'],
  followingIds: ['user2', 'user3'],
  followerIds: ['user2', 'user3', 'user4'],
  interests: ['戶外活動', '攝影', '旅行', '美食'],
  createdAt: DateTime(2024, 1, 1),
  updatedAt: DateTime(2024, 4, 1),
);

/// 模擬用戶列表
final List<User> mockUsers = [
  currentUser,
  User(
    id: 'user2',
    name: '李小華本地測試',
    email: 'xiaohua@example.com',
    avatarUrl: 'https://picsum.photos/200?random=2',
    bio: '喜歡讀書和寫作，偶爾參加戶外活動。',
    hostingEventIds: ['event3'],
    participatingEventIds: ['event1', 'event2'],
    followingIds: ['user1', 'user3'],
    followerIds: ['user1', 'user3'],
    interests: ['閱讀', '寫作', '戶外活動'],
    createdAt: DateTime(2024, 1, 15),
    updatedAt: DateTime(2024, 3, 15),
  ),
  User(
    id: 'user3',
    name: '張大偉本地測試',
    email: 'dawei@example.com',
    avatarUrl: 'https://picsum.photos/200?random=3',
    bio: '專業攝影師，喜歡分享攝影技巧。',
    hostingEventIds: ['event4'],
    participatingEventIds: ['event1'],
    followingIds: ['user1', 'user2'],
    followerIds: ['user1', 'user2'],
    interests: ['攝影', '藝術', '旅行'],
    createdAt: DateTime(2024, 2, 1),
    updatedAt: DateTime(2024, 4, 1),
  ),
];

/// 模擬活動列表
final List<Event> mockEvents = [
  Event(
    id: 'event1',
    title: '週末登山活動本地測試',
    description: '一起來爬山，享受大自然的美好！',
    location: '陽明山國家公園',
    dateTime: DateTime(2024, 4, 20, 9, 0),
    maxParticipants: 10,
    currentParticipants: 5,
    hostId: 'user1',
    hostName: '王小明',
    imageUrl: 'https://picsum.photos/300/200?random=1',
    category: '戶外活動',
    status: EventStatus.registrationOpen,
  ),
  Event(
    id: 'event2',
    title: '桌遊之夜本地測試',
    description: '一起來玩桌遊，認識新朋友！',
    location: '台北市信義區',
    dateTime: DateTime(2024, 4, 21, 19, 0),
    maxParticipants: 8,
    currentParticipants: 6,
    hostId: 'user1',
    hostName: '王小明',
    imageUrl: 'https://picsum.photos/300/200?random=2',
    category: '室內活動',
    status: EventStatus.registrationOpen,
  ),
  Event(
    id: 'event3',
    title: '攝影工作坊本地測試',
    description: '專業攝影師指導，學習攝影技巧！',
    location: '台北市大安區',
    dateTime: DateTime(2024, 4, 25, 14, 0),
    maxParticipants: 15,
    currentParticipants: 12,
    hostId: 'user2',
    hostName: '李小華',
    imageUrl: 'https://picsum.photos/300/200?random=3',
    category: '學習',
    status: EventStatus.registrationOpen,
  ),
  Event(
    id: 'event4',
    title: '讀書會本地測試',
    description: '分享閱讀心得，交流不同觀點。',
    location: '台北市公館',
    dateTime: DateTime(2024, 4, 27, 19, 0),
    maxParticipants: 8,
    currentParticipants: 4,
    hostId: 'user3',
    hostName: '張大偉',
    imageUrl: 'https://picsum.photos/300/200?random=4',
    category: '學習',
    status: EventStatus.registrationOpen,
  ),
]; 