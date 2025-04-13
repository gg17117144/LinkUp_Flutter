import 'package:flutter/material.dart';
import 'package:activity_social_app/models/event.dart';
import 'package:activity_social_app/widgets/event_card.dart';
import 'package:activity_social_app/screens/event_detail_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Event> _hostingEvents = [];
  List<Event> _participatingEvents = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    // TODO: 從 Firebase 加載活動數據
    setState(() {
      _hostingEvents = [
        Event(
          id: '1',
          title: '週末登山活動',
          description: '一起來爬山，享受大自然的美好！',
          location: '陽明山國家公園',
          dateTime: DateTime.now().add(const Duration(days: 2)),
          maxParticipants: 10,
          currentParticipants: 5,
          hostId: 'user1',
          hostName: '王小明',
          imageUrl: 'https://example.com/hiking.jpg',
          category: '戶外活動',
          status: EventStatus.registrationOpen,
        ),
        Event(
          id: '2',
          title: '桌遊之夜',
          description: '一起來玩桌遊，認識新朋友！',
          location: '台北市信義區',
          dateTime: DateTime.now().add(const Duration(days: 3)),
          maxParticipants: 8,
          currentParticipants: 6,
          hostId: 'user1',
          hostName: '王小明',
          imageUrl: 'https://example.com/boardgame.jpg',
          category: '室內活動',
          status: EventStatus.registrationOpen,
        ),
      ];

      _participatingEvents = [
        Event(
          id: '3',
          title: '攝影工作坊',
          description: '專業攝影師指導，學習攝影技巧！',
          location: '台北市大安區',
          dateTime: DateTime.now().add(const Duration(days: 5)),
          maxParticipants: 15,
          currentParticipants: 12,
          hostId: 'user2',
          hostName: '李小華',
          imageUrl: 'https://example.com/photography.jpg',
          category: '學習',
          status: EventStatus.registrationOpen,
        ),
      ];
    });
  }

  void _showEventDetails(Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailScreen(event: event),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的活動'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '我主辦的'),
            Tab(text: '我參加的'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEventsList(_hostingEvents),
          _buildEventsList(_participatingEvents),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 導航到創建活動頁面
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEventsList(List<Event> events) {
    if (events.isEmpty) {
      return const Center(
        child: Text('目前沒有活動'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: EventCard(
            event: event,
            onTap: () => _showEventDetails(event),
          ),
        );
      },
    );
  }
}