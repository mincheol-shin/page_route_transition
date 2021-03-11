import 'package:flutter/material.dart';

enum TransitionEffect {
  FADE,
  SCALE,
  RIGHT_TO_LEFT,
  LEFT_TO_RIGHT,
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP
}

extension TransitionEffectExtension on TransitionEffect {
  static Offset _value(TransitionEffect val) {
    switch (val) {
      case TransitionEffect.RIGHT_TO_LEFT:
        return Offset(1.0, 0.0);
      case TransitionEffect.LEFT_TO_RIGHT:
        return Offset(-1.0, 0.0);
      case TransitionEffect.TOP_TO_BOTTOM:
        return Offset(0.0, -1.0);
      case TransitionEffect.BOTTOM_TO_TOP:
        return Offset(0.0, 1.0);
      default:
        return Offset(0.0, 0.0);
    }
  }

  Offset get value => _value(this);
}

class Transition extends PageRouteBuilder {
  Transition({
    required Widget child,
    TransitionEffect transitionEffect = TransitionEffect.FADE,
    Curve curve = Curves.ease,
  })  : this.child = child,
        this.transitionEffect = transitionEffect,
        this.curve = curve,
        super(
          /// Called to obtain the child widget.
          pageBuilder: (BuildContext context, animation, _) => child,
          transitionsBuilder: (BuildContext context, animation, _, __) {
            switch (transitionEffect) {
              case TransitionEffect.FADE:
                return FadeTransition(opacity: animation, child: child);
              case TransitionEffect.SCALE:
                return ScaleTransition(scale: animation, child: child);
              default:
                var tween =
                    Tween(begin: transitionEffect.value, end: Offset.zero)
                        .chain(CurveTween(curve: curve));
                return SlideTransition(
                  transformHitTests: false,
                  position: animation.drive(tween),
                  child: child,
                );
            }
          },
        );

  /// Transition type
  ///
  /// Default to [TransitionEffect.FADE]
  final TransitionEffect transitionEffect;

  /// The widget below this widget in the tree
  final Widget child;

  /// An parametric animation easing curve, i.e. a mapping of the unit interval to the unit interval.
  ///
  /// Default to [Curves.ease]
  final Curve curve;
}
