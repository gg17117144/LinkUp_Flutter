import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class DevToolsScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  DevToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('開發工具'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await _firebaseService.seedAllMockData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('成功寫入 mock 數據！')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('寫入數據時發生錯誤：$e')),
                  );
                }
              },
              child: const Text('寫入 Mock 數據到 Firebase'),
            ),
          ],
        ),
      ),
    );
  }
} 