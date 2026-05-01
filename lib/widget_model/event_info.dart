import 'package:jit_hue/widget_model/emotion_type.dart';

class EventInfo {
  /// 唯一識別
  final String id;

  /// 標題
  final String title;

  /// 描述
  final String? description;

  /// 發生時間
  final DateTime time;

  /// 🎯 情緒（改為強型別）
  final EmotionType? emotion;

  /// 標籤
  final List<String>? tags;

  EventInfo({
    String? id,
    required this.title,
    this.description,
    required this.time,
    this.emotion,
    this.tags,
  }) : id = id ?? time.microsecondsSinceEpoch.toString();

  /// 🔁 copyWith（支援情緒更新）
  EventInfo copyWith({
    String? title,
    String? description,
    DateTime? time,
    EmotionType? emotion,
    List<String>? tags,
  }) {
    return EventInfo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      emotion: emotion ?? this.emotion,
      tags: tags ?? this.tags,
    );
  }
}