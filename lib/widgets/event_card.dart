/// 活動卡片組件
/// 
/// 此組件用於顯示活動的基本信息，包括：
/// 1. 活動圖片
/// 2. 活動狀態標籤
/// 3. 活動標題
/// 4. 活動地點
/// 5. 活動時間
/// 6. 操作按鈕（聊天室和詳情）
/// 
/// 主要功能：
/// 1. 顯示活動的視覺信息
/// 2. 提供活動狀態的視覺反饋
/// 3. 支持點擊查看詳情
/// 4. 提供快速進入聊天室的入口

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:activity_social_app/models/event.dart';

class EventCard extends StatelessWidget {
  /// 活動數據
  final Event event;
  
  /// 點擊事件回調
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.event,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 設置點擊事件
      onTap: onTap,
      child: Container(
        // 設置卡片樣式
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // 活動圖片和狀態標籤
            Stack(
              children: [
                // 活動圖片
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: event.imageUrl,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // 加載中顯示灰色背景
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                    ),
                    // 加載失敗顯示錯誤圖標
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 活動地點
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event.location,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // 活動時間
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${event.dateTime.year}/${event.dateTime.month}/${event.dateTime.day} ${event.dateTime.hour}:${event.dateTime.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 操作按鈕
                  Row(
                    children: [
                      // 聊天室按鈕
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // TODO: Navigate to chat
                          },
                          icon: const Icon(Icons.chat),
                          label: const Text('聊天室'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // 詳情按鈕
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: onTap,
                          icon: const Icon(Icons.info),
                          label: const Text('詳情'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 