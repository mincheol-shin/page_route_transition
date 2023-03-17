import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';

class TransitionExampleScreen extends StatelessWidget {
  const TransitionExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Route Transition Example"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(),
            );
            // PageRouteTransition.pop(context, false);
          },
          child: Container(
            width: 100.0,
            height: 32.0,
            color: Colors.grey[400],
            alignment: Alignment.center,
            child: Text("Pop"),
          ),
        ),
      ),
    );
  }
}
