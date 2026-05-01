import 'package:flutter/material.dart';
import 'package:jit_hue/widget_model/event_info.dart';
import 'package:jit_hue/widget_model/emotion_type.dart';

/// 🎴 EventCardWidget
/// 👉 單一事件卡片（純 UI，資料驅動）
///
/// 特點：
/// - 使用 EmotionType 控制顏色
/// - 支援情緒標籤顯示
/// - 可擴展（點擊 / 展開 / 編輯）
class EventCardWidget extends StatelessWidget {
  /// 📦 事件資料
  final EventInfo event;

  /// 🧩 點擊事件（可選）
  final VoidCallback? onTap;

  const EventCardWidget({
    super.key,
    required this.event,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final emotionColor = event.emotion?.color ?? Colors.grey;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          /// 🎨 淡色背景（有情緒時才有）
          color: event.emotion != null
              ? emotionColor.withOpacity(0.08)
              : Colors.white,

          borderRadius: BorderRadius.circular(12),

          /// 🌫️ 陰影
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          children: [
            /// 🟡 左側情緒色條
            _buildTimelineIndicator(emotionColor),

            const SizedBox(width: 12),

            /// 📝 內容區
            Expanded(child: _buildContent(emotionColor)),

            /// ⏰ 時間
            _buildTime(),
          ],
        ),
      ),
    );
  }

  /// 🟡 左側情緒色條
  Widget _buildTimelineIndicator(Color color) {
    return Container(
      width: 6,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  /// 📝 內容區
  Widget _buildContent(Color emotionColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 標題
        Text(
          event.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        /// 情緒標籤（🔥 核心）
        if (event.emotion != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              event.emotion!.label,
              style: TextStyle(
                fontSize: 12,
                color: emotionColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

        /// 描述
        if (event.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              event.description!,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),

        /// 🏷️ Tags
        if (event.tags != null && event.tags!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Wrap(
              spacing: 6,
              children: event.tags!
                  .map((tag) => _buildTag(tag))
                  .toList(),
            ),
          ),
      ],
    );
  }

  /// 🏷️ Tag UI
  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }

  /// ⏰ 時間
  Widget _buildTime() {
    return Text(
      _formatTime(event.time),
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }

  /// 🕒 時間格式
  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}