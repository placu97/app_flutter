import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class FliperScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {

    Rx<bool> showFrontSide = true.obs;
    final animCtrl = useAnimationController(duration: 3500.milliseconds,initialValue: 1);
    final anim= Tween<double>(begin:0, end: 300);
    final ss = CurvedAnimation(parent: animCtrl, curve: Curves.easeIn);
    useEffect((){
      animCtrl.forward();
      print(animCtrl.value);
    });
    void flip() {
      animCtrl.addStatusListener((status) { 

      });
      if (showFrontSide.value) {
        animCtrl.forward();
      } else {
        animCtrl.reverse();
      }
    }

    var hig = 100.0.obs;
    var wid = 100.0.obs;

    return Scaffold(
      body: [
        VxBox().red200.make().wh(anim.evaluate(animCtrl), anim.evaluate(animCtrl)),
       Obx(()=> AnimatedContainer(
          duration: 0.3.seconds,
          curve: Curves.easeInOut,
          //transform: Matrix4.identity()..translate(150,150)..multiply(Matrix4.rotationZ(pi/4))..translate(-150,-150),
          height: hig.value, width: wid.value,
          color: Colors.amber,
        ),)
      ].vStack().onTap(() {wid.value+= 100;hig.value+=100;})
    );
  }
}