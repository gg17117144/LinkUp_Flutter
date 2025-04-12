import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Chats'),
      ),
      body: ListView.builder(
        itemCount: 10, // TODO: Replace with actual data
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.event),
            ),
            title: Text('Event Chat ${index + 1}'),
            subtitle: Text(
              'Last message • ${index + 1}m ago',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
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
            onTap: () {
              // TODO: Navigate to chat details
            },
          );
        },
      ),
    );
  }
}