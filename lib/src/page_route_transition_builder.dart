import 'package:flutter/material.dart';

import '../page_route_transition.dart';

class PageRouteTransitionBuilder extends PageRouteBuilder {
  PageRouteTransitionBuilder({
    required Widget page,
    TransitionEffect effect = TransitionEffect.fade,
    Curve curve = Curves.ease,
    RouteSettings? settings,
  })  : this.page = page,
        this.effect = effect,
        this.curve = curve,
        super(
          /// Called to obtain the child widget.
          pageBuilder: (_, __, ___) => page,
          settings: settings,
          transitionsBuilder: (BuildContext context, animation, _, child) {
            switch (effect) {
              case TransitionEffect.none:
                return child;
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
          },
        );

  /// Transition type
  ///
  /// Default to [TransitionEffect.FADE]
  final TransitionEffect effect;

  /// The widget below this widget in the tree
  final Widget page;

  /// An parametric animation easing curve, i.e. a mapping of the unit interval to the unit interval.
  ///
  /// Default to [Curves.ease]
  final Curve curve;
}
