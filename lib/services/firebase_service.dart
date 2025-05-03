import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import '../models/event.dart';
import '../models/mock_data.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 將 mock 用戶數據寫入 Firebase
  Future<void> seedMockUsers() async {
    try {
      for (var user in mockUsers) {
        await _firestore.collection('users').doc(user.id).set(user.toFirestore());
        print('Successfully added user: ${user.name}');
      }
    } catch (e) {
      print('Error seeding users: $e');
    }
  }

  /// 將 mock 活動數據寫入 Firebase
  Future<void> seedMockEvents() async {
    try {
      for (var event in mockEvents) {
        await _firestore.collection('events').doc(event.id).set({
          'id': event.id,
          'title': event.title,
          'description': event.description,
          'location': event.location,
          'dateTime': event.dateTime.toIso8601String(),
          'maxParticipants': event.maxParticipants,
          'currentParticipants': event.currentParticipants,
          'hostId': event.hostId,
          'hostName': event.hostName,
          'imageUrl': event.imageUrl,
          'category': event.category,
          'status': event.status.toString(),
        });
        print('Successfully added event: ${event.title}');
      }
    } catch (e) {
      print('Error seeding events: $e');
    }
  }

  /// 一次性寫入所有 mock 數據
  Future<void> seedAllMockData() async {
    await seedMockUsers();
    await seedMockEvents();
  }
} 