import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Route Transition Example"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          transitionButton(
              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
              title: "RightToLeft"),
          transitionButton(
              transitionEffect: TransitionEffect.LEFT_TO_RIGHT,
              title: "LeftToRight"),
          transitionButton(
              transitionEffect: TransitionEffect.BOTTOM_TO_TOP,
              title: "BottomToTop"),
          transitionButton(
              transitionEffect: TransitionEffect.TOP_TO_BOTTOM,
              title: "TopToBottom"),
          transitionButton(
              transitionEffect: TransitionEffect.SCALE, title: "Scale"),
          transitionButton(
              transitionEffect: TransitionEffect.FADE, title: "Fade"),
        ]),
      ),
    );
  }

  Widget transitionButton(
      {required TransitionEffect transitionEffect, required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              Transition(
                  child: SecondScreen(), transitionEffect: transitionEffect));
        },
        child: Container(
            height: 40.0,
            width: 100.0,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Text(title)),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Route Transition Example"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Pop"),
        ),
      ),
    );
  }
}
