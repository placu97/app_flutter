import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/model/cards_model.dart';

class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({Key? key, required this.card}) : super(key: key);

  final Card3D card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,iconTheme: IconThemeData(color: Colors.black45),),
      body: [

        HeightBox(context.percentHeight * 10),

        PhysicalModel(
          color: Colors.white,
          elevation: 10, 
          borderRadius: BorderRadius.circular(15),
          child:Image.network(card.image,fit: BoxFit.cover).cornerRadius(15).h(150)).h(150).w(150).centered(),

        HeightBox(20),
        
        "henlooo".text.bold.gray400.make()
        
      ].vStack(crossAlignment: CrossAxisAlignment.center,axisSize: MainAxisSize.max),

    );
  }
}