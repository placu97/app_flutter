import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

// converting state (StatefullWidget => Getx)

class AnimatedContainerAppe extends HookWidget {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  final _width = 50.0.obs;
  final _height = 50.0.obs;
  Rx<Color> _color = Colors.green.obs;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: Obx(()=> AnimatedContainer(
            // Use the properties stored in the State class.
            width: _width.value,
            height: _height.value,
            decoration: BoxDecoration(
              color: _color.value,
              borderRadius: _borderRadius,
            ),
            // Define how long the animation should take.
            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
          )),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user taps the button
          onPressed: () {
            // Use setState to rebuild the widget with new values.
            
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _width.value = random.nextInt(300).toDouble();
              _height.value = random.nextInt(300).toDouble();

              // Generate a random color.
              _color.value = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Generate a random border radius.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            
          },
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}