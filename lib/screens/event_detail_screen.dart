/// 活動詳情頁面
/// 
/// 此頁面用於顯示活動的詳細信息，包括：
/// 1. 活動圖片
/// 2. 活動狀態
/// 3. 活動標題
/// 4. 活動地點
/// 5. 活動時間
/// 6. 參與人數
/// 7. 主辦人信息
/// 8. 活動描述
/// 9. 參加按鈕（如果活動可以參加）
/// 
/// 主要功能：
/// 1. 展示活動的完整信息
/// 2. 提供參加活動的入口
/// 3. 顯示活動的當前狀態

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:activity_social_app/models/event.dart';

class EventDetailScreen extends StatelessWidget {
  /// 活動數據
  final Event event;

  const EventDetailScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 設置頁面標題
      appBar: AppBar(
        title: const Text('活動詳情'),
      ),
      // 使用 SingleChildScrollView 支持滾動
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 活動圖片和狀態標籤
            Stack(
              children: [
                // 活動圖片
                CachedNetworkImage(
                  imageUrl: event.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  // 加載中顯示灰色背景
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                  ),
                  // 加載失敗顯示錯誤圖標
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // 活動狀態標籤
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      event.statusText,
                      style: TextStyle(
                        color: event.statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // 活動信息
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 活動標題
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 活動地點
                  _buildInfoRow(
                    icon: Icons.location_on,
                    text: event.location,
                  ),
                  const SizedBox(height: 8),
                  // 活動時間
                  _buildInfoRow(
                    icon: Icons.calendar_today,
                    text: '${event.dateTime.year}/${event.dateTime.month}/${event.dateTime.day} ${event.dateTime.hour}:${event.dateTime.minute.toString().padLeft(2, '0')}',
                  ),
                  const SizedBox(height: 8),
                  // 參與人數
                  _buildInfoRow(
                    icon: Icons.people,
                    text: '${event.currentParticipants}/${event.maxParticipants} 人',
                  ),
                  const SizedBox(height: 8),
                  // 主辦人信息
                  _buildInfoRow(
                    icon: Icons.person,
                    text: '主辦人：${event.hostName}',
                  ),
                  const SizedBox(height: 16),
                  // 活動描述標題
                  const Text(
                    '活動描述',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 活動描述內容
                  Text(event.description),
                  const SizedBox(height: 24),
                  // 參加按鈕（如果活動可以參加）
                  if (event.canJoin)
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          // TODO: Implement join event
                        },
                        child: const Text('參加活動'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 構建信息行
  /// 
  /// 用於顯示帶圖標的信息行，如地點、時間等
  Widget _buildInfoRow({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
} 