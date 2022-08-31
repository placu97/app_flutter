import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:yoo/screens/diegoVelop/model/cards_model.dart';

class CardsHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Official DiegoVelop".text.black.make(),backgroundColor: Colors.white, elevation: 0,iconTheme: IconThemeData(color: Colors.black),),
      body: Column(
        children: [
          Expanded(child: CardsBody(),flex: 3),

          Expanded(child: CardsHorizontal(),flex: 2,),
        ],
      ),

    );
  }
}//main

class CardsBody extends StatefulWidget {

  @override
  State<CardsBody> createState() => _CardsBodyState();
}

class _CardsBodyState extends State<CardsBody> {

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth * 0.45,
          color: Colors.red,
          child: Stack(
            children: [

              ...List.generate(4, (index) => Card3DItem(height: constraints.maxHeight / 2,card: cardList[index], percent: _value)).reversed,
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Slider(value: _value, onChanged: (val) { setState(() {
                  _value = val;
                });} ),
              )

            ]
          ),
        );
      }
    );
  }
}

class CardsHorizontal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Padding(padding: EdgeInsets.all(12),child: Text("Recently Played")),

        Expanded(child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: cardList.length, itemBuilder: (context, index) {
          final card = cardList[index];
          return Padding(padding: const EdgeInsets.all(10),child: Card3DWidget(card: card,));
        },))
      ],
    );
  }
}


class Card3DWidget extends StatelessWidget {
  const Card3DWidget({ required this.card }) ;

  final Card3D card;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(borderRadius: BorderRadius.circular(15), color: Colors.white, elevation: 10, child: ClipRRect( borderRadius: BorderRadius.circular(15), child: Image.network(card.image,fit: BoxFit.cover,)));
  }
}


class Card3DItem extends StatelessWidget {
  const Card3DItem({Key? key, required this.card, required this.percent, required this.height}) : super(key: key);

  final Card3D card;
  final double percent;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: height + 30 * percent,
      child: SizedBox(
        height: height,
        child: Card3DWidget(card: card,),
      ),
    );
  }
}
