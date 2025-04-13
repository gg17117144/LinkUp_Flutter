import 'package:flutter/material.dart';

enum EventStatus {
  registrationOpen,
  registrationClosed,
  ongoing,
  completed,
  cancelled
}

class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime dateTime;
  final int maxParticipants;
  final int currentParticipants;
  final String hostId;
  final String hostName;
  final String imageUrl;
  final String category;
  final EventStatus status;

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

  bool get isFull => currentParticipants >= maxParticipants;
  bool get canJoin => status == EventStatus.registrationOpen && !isFull;

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