import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:yoo/screens/proj/intro.dart';
import 'package:yoo/screens/proj/shape_custom.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: [

        "presentazione".text .xl3 .yellow400 .wider .uppercase .makeCentered() .onInkTap(() { Get.to( ()=> WithPages()); }),

        ClipPath(
          clipper: ExmplCustomPainter(),
          child: VxBox().blue300.makeCentered()),

        PhysicalModel(
          color: Colors.pink,
          child: VxBox().height(250) .make(),
        ).clipOval() .positioned(top:-100, left:0, right:0),

        ListView.builder(itemCount: 20, itemBuilder: (context, index) {
          return 
          PhysicalModel(
            color: Colors.transparent,
            elevation: 20,shadowColor: Colors.grey.shade200,
            child: VxCard("ciao".text.make()) .color(Colors.primaries[index % Colors.primaries.length]) .withRounded(value: 30) .make() .h(300) .p12()
            .onInkTap(() {  }) );
          //VxBox() .withRounded(value: 20) .height(300) .color(Colors.primaries[index % Colors.primaries.length]) .make() .p20();
        },)
      ].reversed.toList().stack(),

    );
  }
}