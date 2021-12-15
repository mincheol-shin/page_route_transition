import 'package:flutter/material.dart';
import 'package:transition/page_route_transition.dart';

import 'widgets/transition_button.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Route Transition Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TransitionButton(
              effect: TransitionEffect.none,
              title: "None",
            ),
            const TransitionButton(
              effect: TransitionEffect.rightToLeft,
              title: "RightToLeft",
            ),
            const TransitionButton(
              effect: TransitionEffect.leftToRight,
              title: "LeftToRight",
            ),
            const TransitionButton(
              effect: TransitionEffect.bottomToTop,
              title: "BottomToTop",
            ),
            const TransitionButton(
              effect: TransitionEffect.topToBottom,
              title: "TopToBottom",
            ),
            const TransitionButton(
              effect: TransitionEffect.scale,
              title: "Scale",
            ),
            const TransitionButton(
              effect: TransitionEffect.fade,
              title: "Fade",
            ),
          ],
        ),
      ),
    );
  }
}
