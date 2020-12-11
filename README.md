# transition

A transition library that helps implement the page transition animation. :dizzy:

[![pub](https://img.shields.io/pub/v/transition)](https://pub.dev/packages/transition)


<br>

# Showcase

<img src = "https://user-images.githubusercontent.com/55150540/101777184-74929100-3b35-11eb-89fb-0620446f8897.gif" width = 200>

<br> 

# Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:
```yaml
dependencies:
  transition : "^lastest_version"
```

<br>

# Usage
Need to include the import the package to the dart file where it will be used, refer the below command
```dart
import 'package:transition/transition.dart';
```

<br>

# Complete example
```dart
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
                          transitionEffect: TransitionEffect.bottomToTop)
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


```
<br>

# License
```
Copyright 2020, the Flutter project authors. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
