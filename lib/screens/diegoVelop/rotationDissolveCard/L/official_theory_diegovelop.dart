import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class AnimTheoryOffiziel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final value = 0.0.obs;

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: "AnimTheoryOffiziel".text.make(),),
      body: [

        Obx(()=> Transform(
          child: FlutterLogo(size: 200),
          alignment: Alignment.center,
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(value.value*pi),)
        //.scale(scaleValue:  value.value * 3)
        //.offset(offset: Offset(-value.value * 200, value.value * 500 ))
        //.rotate(300* value.value)
        ),
        Obx( ()=> Slider(value: value.value, onChanged: (val){ value.value = val; })),

      ].vStack(alignment: MainAxisAlignment.center, axisSize: MainAxisSize.max), 
    );
  }
}