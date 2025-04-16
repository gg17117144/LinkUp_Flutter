/// 聊天頁面
/// 
/// 此頁面用於顯示用戶參與的活動聊天列表，包括：
/// 1. 聊天列表
/// 2. 每個聊天的基本信息：
///    - 活動圖標
///    - 聊天標題
///    - 最後消息時間
///    - 未讀消息數量（如果有）
/// 
/// 主要功能：
/// 1. 顯示用戶參與的所有活動聊天
/// 2. 提供快速進入特定聊天的入口
/// 3. 顯示未讀消息提醒

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 設置頁面標題
      appBar: AppBar(
        title: const Text('Event Chats'),
      ),
      // 聊天列表
      body: ListView.builder(
        // TODO: 替換為實際數據
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            // 活動圖標
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.event),
            ),
            // 聊天標題
            title: Text('Event Chat ${index + 1}'),
            // 最後消息時間
            subtitle: Text(
              'Last message • ${index + 1}m ago',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            // 未讀消息提醒
            trailing: index % 3 == 0
                ? Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  )
                : null,
            // 點擊進入聊天詳情
            onTap: () {
              // TODO: Navigate to chat details
            },
          );
        },
      ),
    );
  }
}