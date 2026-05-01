import 'package:flutter/material.dart';
import 'package:jit_hue/widget/event_card.dart';
import 'package:jit_hue/widget_model/event_info.dart';

/// 🎬 AnimatedEventItem
/// 👉 單一事件的「動畫包裝器」
///
/// 職責：
/// - 控制進場動畫（fade + slide）
/// - 包裝 EventCardWidget
class AnimatedEventItem extends StatefulWidget {
  final EventInfo event;

  const AnimatedEventItem({super.key, required this.event});

  @override
  State<AnimatedEventItem> createState() => _AnimatedEventItemState();
}

class _AnimatedEventItemState extends State<AnimatedEventItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    /// 🎬 初始化動畫
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2), // 從下滑入
      end: Offset.zero,
    ).animate(_controller);

    /// 👉 元件建立時直接播放（新增事件時觸發）
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: EventCardWidget(event: widget.event),
      ),
    );
  }
}
