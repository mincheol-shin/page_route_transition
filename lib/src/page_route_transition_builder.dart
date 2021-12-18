import 'package:flutter/material.dart';

import '../page_route_transition.dart';

class PageRouteTransitionBuilder extends PageRouteBuilder {
  PageRouteTransitionBuilder({
    required Widget page,
    TransitionEffect effect = TransitionEffect.fade,
    Curve curve = Curves.ease,
    Duration duration = const Duration(milliseconds: 300),
    RouteSettings? settings,
  })  : this.page = page,
        this.effect = effect,
        this.curve = curve,
        this.duration = duration,
        super(
          pageBuilder: (_, __, ___) => page,
          settings: settings,
          transitionDuration:
              effect == TransitionEffect.none ? Duration.zero : duration,
          reverseTransitionDuration:
              effect == TransitionEffect.none ? Duration.zero : duration,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (effect) {
      case TransitionEffect.none:
      case TransitionEffect.theme:
        return Theme.of(context).pageTransitionsTheme.buildTransitions(
            this, context, animation, secondaryAnimation, child);
      case TransitionEffect.fade:
        return FadeTransition(opacity: animation, child: child);
      case TransitionEffect.scale:
        return ScaleTransition(scale: animation, child: child);
      default:
        var tween = Tween(begin: effect.value, end: Offset.zero)
            .chain(CurveTween(curve: curve));
        return SlideTransition(
          transformHitTests: false,
          position: animation.drive(tween),
          child: child,
        );
    }
  }

  /// Transition type
  ///
  /// Default to [TransitionEffect.FADE]
  final TransitionEffect effect;

  /// The widget below this widget in the tree
  final Widget page;

  /// The duration the transition going reverse and forwards
  final Duration duration;

  /// An parametric animation easing curve, i.e. a mapping of the unit interval to the unit interval.
  ///
  /// Default to [Curves.ease]
  final Curve curve;
}
