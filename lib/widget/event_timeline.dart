import 'package:flutter/material.dart';
import 'package:jit_hue/widget/animated_event_item.dart';
import 'package:jit_hue/widget_model/event_info.dart';

class EventTimelineWidget extends StatefulWidget {
  const EventTimelineWidget({super.key});

  @override
  State<EventTimelineWidget> createState() => EventTimelineWidgetState();
}

class EventTimelineWidgetState extends State<EventTimelineWidget> {
  final List<EventInfo> _events = [];

  /// 🔥 新增事件（核心入口）
  void addEvent(EventInfo event) {
    setState(() {
      _events.insert(0, event); // 最新在最上面
    });
  }

  /// 🧠 可選：清空
  void clear() {
    setState(() {
      _events.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_events.isEmpty) {
      return const Center(
        child: Text(
          "尚未建立任何事件",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: _events.length,
      itemBuilder: (context, index) {
        final event = _events[index];

        return AnimatedEventItem(
          key: ValueKey(event.id), // 🔥 用 id 比 time 更安全
          event: event,
        );
      },
    );
  }
}