import 'package:flutter/material.dart';

enum TransitionEffect {
  fade,
  scale,
  rightToLeft,
  leftToRight,
  topToBottom,
  bottomToTop,
}

extension TransitionEffectExtension on TransitionEffect {
  static Offset _value(TransitionEffect val) {
    switch (val) {
      case TransitionEffect.rightToLeft:
        return Offset(1.0, 0.0);
        break;
      case TransitionEffect.leftToRight:
        return Offset(-1.0, 0.0);
        break;
      case TransitionEffect.topToBottom:
        return Offset(0.0, -1.0);
        break;
      case TransitionEffect.bottomToTop:
        return Offset(0.0, 1.0);
        break;
      default:
        return Offset(0.0, 0.0);
    }
  }

  Offset get value => _value(this);
}

class Transition {
  const Transition({
    @required Widget child,
    TransitionEffect transitionEffect = TransitionEffect.fade,
    Curve curve = Curves.ease,
  })  : this.child = child,
        this.transitionEffect = transitionEffect,
        this.curve = curve,
        assert(child != null);

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

  /// Called to obtain the child widget.
  Route builder() => PageRouteBuilder(
        pageBuilder: (BuildContext context, animation, _) => child,
        transitionsBuilder: (BuildContext context, animation, _, __) {
          switch (transitionEffect) {
            case TransitionEffect.fade:
              return FadeTransition(opacity: animation, child: child);
              break;
            case TransitionEffect.scale:
              return ScaleTransition(scale: animation, child: child);

            default:
              var tween = Tween(begin: transitionEffect.value, end: Offset.zero)
                  .chain(CurveTween(curve: curve));
              return SlideTransition(
                transformHitTests: false,
                position: animation.drive(tween),
                child: child,
              );
              break;
          }
        },
      );
}
