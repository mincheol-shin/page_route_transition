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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                          child: SecondScreen(),
                          transitionEffect: TransitionEffect.rightToLeft)
                      .builder(),
                );
              },
              child: Text("RightToLeft"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                          child: SecondScreen(),
                          transitionEffect: TransitionEffect.leftToRight)
                      .builder(),
                );
              },
              child: Text("LeftToRight"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                          child: SecondScreen(),
                          transitionEffect: TransitionEffect.buttonToTop)
                      .builder(),
                );
              },
              child: Text("bottomToTop"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                          child: SecondScreen(),
                          transitionEffect: TransitionEffect.topToBottom)
                      .builder(),
                );
              },
              child: Text("TopToBottom"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                          child: SecondScreen(),
                          transitionEffect: TransitionEffect.scale)
                      .builder(),
                );
              },
              child: Text("Scale"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  Transition(
                          child: SecondScreen(),
                          transitionEffect: TransitionEffect.fade)
                      .builder(),
                );
              },
              child: Text("Fade"),
            ),
          ],
        ),
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
