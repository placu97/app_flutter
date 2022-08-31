import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class Anim2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, title: "Animm222".text.black.make(),),
      body: [
        BodyWidget().expand(flex: 3),
        Placeholder().expand(flex: 1),
      ].vStack(),

    );
  }
}



class BodyWidget extends StatelessWidget {

  var sliderValue = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {

    return Obx(()=> [
      //...List.generate(4, (index) => Container(child: "$index".text.xl4.black.make(),)),
      MovingPhObjWidget(height: constraints.maxHeight, percent: sliderValue.value),
    
      Slider(value: sliderValue.value, onChanged: (val){ sliderValue.value = val; } ).positioned(bottom: 0, left: 0, right: 0),
    ].stack());

   }));
  }
} 

class MovingPhObjWidget extends StatelessWidget {
  const MovingPhObjWidget({Key? key, required this.height, required this.percent, }) : super(key: key);

  final double height;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        top: height + 30 * percent,
        child: SizedBox(
          height: height,
          child: PhysicalModel(
            color: Colors.white,
            elevation: 8,
            child:  Image.network("https://picsum.photos/300/300",fit: BoxFit.cover,).cornerRadius(15).p(10)
          ),
        ) );
  }
}

List cards = [
  PhysicalModel(
      color: Colors.white,
      elevation: 8,
      child:  Image.network("https://picsum.photos/300/300",fit: BoxFit.cover,).cornerRadius(15).p(10)
    ),
    
  PhysicalModel(
      color: Colors.white,
      elevation: 8,
      child:  Image.network("https://picsum.photos/299/299",fit: BoxFit.cover,).cornerRadius(15).p(10)
    ),
  PhysicalModel(
      color: Colors.white,
      elevation: 8,
      child:  Image.network("https://picsum.photos/298/298",fit: BoxFit.cover,).cornerRadius(15).p(10)
    ),
  PhysicalModel(
      color: Colors.white,
      elevation: 8,
      child:  Image.network("https://picsum.photos/300/300",fit: BoxFit.cover,).cornerRadius(15).p(10)
    ),

];