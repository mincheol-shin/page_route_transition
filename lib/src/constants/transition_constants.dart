import 'package:flutter/material.dart';

enum TransitionEffect {
  none,
  theme,
  fade,
  scale,
  rightToLeft,
  leftToRight,
  topToBottom,
  bottomToTop,
}

extension TransitionEffectExtension on TransitionEffect {
  static Offset _value(TransitionEffect effect) {
    switch (effect) {
      case TransitionEffect.rightToLeft:
        return const Offset(1.0, 0.0);
      case TransitionEffect.leftToRight:
        return const Offset(-1.0, 0.0);
      case TransitionEffect.topToBottom:
        return const Offset(0.0, -1.0);
      case TransitionEffect.bottomToTop:
        return const Offset(0.0, 1.0);
      default:
        return const Offset(0.0, 0.0);
    }
  }

  Offset get value => _value(this);
}
