import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:yoo/screens/diegoVelop/model/cards_model.dart';

class Anim2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, title: "Animm222".text.black.make(),),
      body: [
        BodyWidget().expand(flex: 3),
        ScrollHWidget().expand(flex: 2),
      ].vStack(),

    );
  }
}

// BODY (upper part)

class BodyWidget extends StatelessWidget {

  var sliderValue = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return [
        
        //CardWidget()
        ...List.generate(4, (index) => Obx( ()=> CardWidget(height: constraints.maxHeight / 2,card: cardList[index], percent: sliderValue.value))).reversed,

        Obx( ()=> Slider(value: sliderValue.value, onChanged: (val){ sliderValue.value = val; } ).positioned(bottom: 0, left: 0, right: 0),)//fine Obx
      
      ].stack()
      .w(constraints.maxWidth * 0.45,).h(constraints.maxHeight).backgroundColor(Colors.red);

    });
  }
}

class CardWidget extends StatelessWidget {
  CardWidget({ required this.height , required this.card, required this.percent });

  double height;
  Card3D card;
  double percent;
  

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 10, 
      borderRadius: BorderRadius.circular(15),
      child: Image.network(card.image,fit: BoxFit.cover).cornerRadius(15).h(height))
    .positioned(top: height + 30 * percent, left: 0, right: 0);
    // return PhysicalModel(
    //   borderRadius: BorderRadius.circular(15),
    //   color: Colors.white, elevation: 10, 
    //   child: ClipRRect( 
    //     borderRadius: BorderRadius.circular(15),
    //     child: Image.network(card.image,fit: BoxFit.cover,)));
  }
}

// *** fine BODY

// CARDS HORIZONTAL (bottom part)

class ScrollHWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return [

      "Recently played".text.make().p(12),

      ListView.builder(itemCount: 4 ,scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
        final card = cardList[index];
        return PhysicalModel(
          color: Colors.white,
          elevation: 10, 
          borderRadius: BorderRadius.circular(15),
          child: Image.network(card.image,fit: BoxFit.cover).cornerRadius(15)).p(12);
      },).expand(),
     
    ].vStack();
  }
}