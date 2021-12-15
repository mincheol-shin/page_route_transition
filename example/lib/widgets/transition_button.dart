import 'package:flutter/material.dart';
import 'package:transition/page_route_transition.dart';
import 'package:transition_example/screens/transition_example_screen.dart';

class TransitionButton extends StatelessWidget {
  const TransitionButton({
    required this.effect,
    required this.title,
  });

  final TransitionEffect effect;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          PageRouteTransition.effect = effect;
          PageRouteTransition.push(context, const TransitionExampleScreen());
          /// OR
          // Navigator.push(context, PageRouteTransitionBuilder(page: const TransitionExampleScreen(), effect: effect));
        },
        child: Container(
          width: 100.0,
          height: 32.0,
          color: Colors.grey[300],
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}
