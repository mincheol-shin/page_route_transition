# transition

A transition library that helps implement the page transition animation. :dizzy:

[![pub](https://img.shields.io/pub/v/transition)](https://pub.dev/packages/transition)


<br>

# Showcase

<img src = "https://user-images.githubusercontent.com/55150540/146198658-4e33ffbe-324b-4f57-8793-223fe5fa9b90.gif" width = 200>

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
import 'package:transition/page_route_transition.dart';

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
