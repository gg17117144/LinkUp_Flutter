import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:activity_social_app/models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('活動詳情'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: event.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    icon: Icons.location_on,
                    text: event.location,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    icon: Icons.calendar_today,
                    text: '${event.dateTime.year}/${event.dateTime.month}/${event.dateTime.day} ${event.dateTime.hour}:${event.dateTime.minute.toString().padLeft(2, '0')}',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    icon: Icons.people,
                    text: '${event.currentParticipants}/${event.maxParticipants} 人',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    icon: Icons.person,
                    text: '主辦人：${event.hostName}',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '活動描述',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(event.description),
                  const SizedBox(height: 24),
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