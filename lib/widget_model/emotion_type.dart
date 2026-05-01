import 'package:flutter/material.dart';

enum EmotionType {
  // 🟡 JOY 系
  serenity,
  joy,
  ecstasy,

  // 🟢 TRUST 系
  acceptance,
  trust,
  admiration,

  // 🟢 FEAR 系
  apprehension,
  fear,
  terror,

  // 🔵 SURPRISE 系
  distraction,
  surprise,
  amazement,

  // 🔵 SADNESS 系
  pensiveness,
  sadness,
  grief,

  // ⚪ DISGUST 系
  boredom,
  disgust,
  loathing,

  // 🔴 ANGER 系
  annoyance,
  anger,
  rage,

  // 🟠 ANTICIPATION 系
  interest,
  anticipation,
  vigilance,
}

extension EmotionColor on EmotionType {
  Color get color {
    switch (this) {

    // 🟡 JOY（黃）
      case EmotionType.serenity:
        return Colors.yellow.shade200;
      case EmotionType.joy:
        return Colors.yellow;
      case EmotionType.ecstasy:
        return Colors.yellow.shade700;

    // 🟢 TRUST（綠）
      case EmotionType.acceptance:
        return Colors.green.shade200;
      case EmotionType.trust:
        return Colors.green;
      case EmotionType.admiration:
        return Colors.green.shade700;

    // 🟢 FEAR（偏綠深）
      case EmotionType.apprehension:
        return Colors.lightGreen.shade200;
      case EmotionType.fear:
        return Colors.lightGreen;
      case EmotionType.terror:
        return Colors.lightGreen.shade800;

    // 🔵 SURPRISE（青）
      case EmotionType.distraction:
        return Colors.cyan.shade200;
      case EmotionType.surprise:
        return Colors.cyan;
      case EmotionType.amazement:
        return Colors.cyan.shade700;

    // 🔵 SADNESS（藍）
      case EmotionType.pensiveness:
        return Colors.blue.shade200;
      case EmotionType.sadness:
        return Colors.blue;
      case EmotionType.grief:
        return Colors.blue.shade900;

    // ⚪ DISGUST（紫灰）
      case EmotionType.boredom:
        return Colors.purple.shade200;
      case EmotionType.disgust:
        return Colors.purple;
      case EmotionType.loathing:
        return Colors.purple.shade800;

    // 🔴 ANGER（紅）
      case EmotionType.annoyance:
        return Colors.red.shade200;
      case EmotionType.anger:
        return Colors.red;
      case EmotionType.rage:
        return Colors.red.shade900;

    // 🟠 ANTICIPATION（橘）
      case EmotionType.interest:
        return Colors.orange.shade200;
      case EmotionType.anticipation:
        return Colors.orange;
      case EmotionType.vigilance:
        return Colors.orange.shade800;
    }
  }
}

extension EmotionLabel on EmotionType {
  String get label {
    switch (this) {
      case EmotionType.serenity: return "平靜";
      case EmotionType.joy: return "喜悅";
      case EmotionType.ecstasy: return "狂喜";

      case EmotionType.acceptance: return "接納";
      case EmotionType.trust: return "信任";
      case EmotionType.admiration: return "欽佩";

      case EmotionType.apprehension: return "擔憂";
      case EmotionType.fear: return "恐懼";
      case EmotionType.terror: return "驚恐";

      case EmotionType.distraction: return "分心";
      case EmotionType.surprise: return "驚訝";
      case EmotionType.amazement: return "驚奇";

      case EmotionType.pensiveness: return "沉思";
      case EmotionType.sadness: return "悲傷";
      case EmotionType.grief: return "悲痛";

      case EmotionType.boredom: return "無聊";
      case EmotionType.disgust: return "厭惡";
      case EmotionType.loathing: return "憎恨";

      case EmotionType.annoyance: return "煩躁";
      case EmotionType.anger: return "憤怒";
      case EmotionType.rage: return "暴怒";

      case EmotionType.interest: return "興趣";
      case EmotionType.anticipation: return "期待";
      case EmotionType.vigilance: return "警覺";
    }
  }
}