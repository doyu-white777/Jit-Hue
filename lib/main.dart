import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jit_hue/widget/event_timeline.dart';
import 'package:jit_hue/widget_model/emotion_type.dart';
import 'package:jit_hue/widget_model/event_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TimelinePage());
  }
}

/// 🧾 Timeline 頁面（你的主畫面）
class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  /// 🔑 控制整個 Timeline（不是單一卡片）
  final GlobalKey<EventTimelineWidgetState> timelineKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("日花 Timeline 🌱")),

      /// 📦 Timeline 容器
      body: EventTimelineWidget(key: timelineKey),

      /// ➕ 測試新增事件
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          timelineKey.currentState?.addEvent(
            EventInfo(
              title: "新增一筆事件",
              description: "這是測試資料",
              time: DateTime.now(),
              emotion: randomEmotion(),
              // 🔥 這裡
              tags: ["測試", "日記"],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  EmotionType randomEmotion() {
    final values = EmotionType.values;
    final random = Random();
    return values[random.nextInt(values.length)];
  }
}
