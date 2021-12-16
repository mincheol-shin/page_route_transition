import 'package:flutter/material.dart';

import '../page_route_transition.dart';

class PageRouteTransition {
  PageRouteTransition._();

  static final PageRouteTransition _transition = PageRouteTransition._();

  factory PageRouteTransition() => _transition;

  /// Transition type
  static TransitionEffect effect = TransitionEffect.theme;

  /// An parametric animation easing curve, i.e. a mapping of the unit interval to the unit interval.
  static Curve curve = Curves.ease;

  /// Data that might be useful in constructing a [Route].
  static RouteSettings? settings;

  /// The duration the transition going reverse and forwards
  static Duration duration = const Duration(milliseconds: 300);

  static Future push(BuildContext context, Widget page) async {
    return Navigator.push(
        context,
        PageRouteTransitionBuilder(
            page: page,
            effect: effect,
            curve: curve,
            settings: settings,
            duration: duration));
  }

  static Future pushReplacement(BuildContext context, Widget page) async {
    return Navigator.pushReplacement(
        context,
        PageRouteTransitionBuilder(
            page: page,
            effect: effect,
            curve: curve,
            settings: settings,
            duration: duration));
  }

  static Future pop<T extends Object?>(BuildContext context,
      [T? result]) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    }
  }
}
