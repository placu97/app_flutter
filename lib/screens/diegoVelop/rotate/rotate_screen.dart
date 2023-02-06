import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class RotateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Vx.green400,
      body: [
        MovingCardWidget().w(context.percentWidth*90).centered(),
      ].stack()
    );
  }
}

class MovingCardWidget extends HookWidget {
  
  final String frontUrl;
  final String backUrl;
  const MovingCardWidget({
    Key? key,
    this.frontUrl = "assets/hotel/hotel_1.png",
    this.backUrl = "assets/hotel/hotel_2.png",

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFront = true.obs;
    var verticalDrag = 180.0.obs;
    final animctrl = useAnimationController(duration: 500.milliseconds);
    var anim;

    // return GestureDetector(
    //   onVerticalDragUpdate: (details) {
    //     verticalDrag.value += details.delta.dy;
    //     verticalDrag.value %= 360;print(verticalDrag.value);
    //   },
    //   onVerticalDragEnd: (details) {
    //     final double end = 360 -verticalDrag.value >= 180 ? 0 : 360;
    //     anim = Tween<double>(begin: verticalDrag.value,end: end).animate(animctrl)
    //     ..addListener(() { verticalDrag.value = anim.value; });
    //     animctrl.forward().then((value) { 
    //       animctrl.reset();
    //       isFront.value = true;
    //       verticalDrag.value = 0;
    //     } );
    //   },
    //   child: Obx(()=> Transform(
    //     transform: Matrix4.identity()
    //     ..setEntry(3, 2, 0.001)
    //     //180/centoottantesimi arrivano a Pigreco (metà angolo giro due pigreco)
    //     ..rotateX(verticalDrag /180  * pi),
    //     alignment: Alignment.center,
    //     child: Obx(()=> isFront.value ? Image.asset(frontUrl) : 
    //       Transform(
    //         transform: Matrix4.identity()..rotateX(pi),
    //         alignment: Alignment.center,
    //         child: Image.asset(backUrl))))),
    // );


    var vdrag = 0.0.obs;

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        vdrag.value += details.delta.dy;
        vdrag.value %= 360;
        print(vdrag.value);
        if (vdrag.value > 270 || vdrag.value < 90 )
          isFront.value = true;
        else
          isFront.value = false;
        print(isFront.value);
      },
      child: Obx(()=> Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(vdrag.value / 180 * pi),
        alignment: Alignment.center,
      child: isFront.value ? Image.asset(frontUrl) : Image.asset(backUrl).rotate180()//rotate45()
      )),
    );
  }
}