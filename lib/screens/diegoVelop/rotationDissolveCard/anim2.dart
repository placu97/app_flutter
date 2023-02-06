import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/card_details_screen.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/model/cards_model.dart';

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

class BodyWidget extends HookWidget {

  //LEgaCY
  //var sliderValue = 0.15.obs;

  @override
  Widget build(BuildContext context) {
    
    final _selected_RowAnimShouldDisplay = false.obs;
    final ctrlRotateRow = useAnimationController(lowerBound: 0.15,upperBound: 0.5,duration: 0.5.seconds);

    final _selected_CardIndex = 0.obs;
    final ctrlTransDetail = useAnimationController(duration: 880.milliseconds);
    Future<void> _oncCardSelected(Card3D card, int index) async {
      _selected_CardIndex.value = index;
      ctrlTransDetail.forward();
      await Get.to(()=> CardDetailScreen(card: card),transition: Transition.fade,duration: 750.milliseconds);
      ctrlTransDetail.reverse(from: 1.0);
    }

    int _getCurrentFactor(int currentIndex){
      if (_selected_CardIndex.value == null || _selected_CardIndex.value == currentIndex )
        return 0;
      else if (currentIndex > _selected_CardIndex.value)
        return -1;
      else
        return 1;
    }


    return AnimatedBuilder(animation: ctrlRotateRow, builder: ((context, child) {
      
    
      return  Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX( ctrlRotateRow.value ),
          child: LayoutBuilder(builder: (context, constraints) {
            return  AbsorbPointer(
              absorbing: !_selected_RowAnimShouldDisplay.value,
              child: [
                
                //CardWidget()
               // [
                ...List.generate(4, (index) =>  CardWidget(height: constraints.maxHeight / 2,card: cardList[index], percent: ctrlRotateRow.value , depth: index, verticalFactor: _getCurrentFactor(index), onCardSelected: (card) => _oncCardSelected(card, index) , animation: ctrlTransDetail,),).reversed,
                //].stack().w(constraints.maxWidth * 0.45,).h(constraints.maxHeight).backgroundColor(Colors.transparent) 
                //Obx( ()=> Slider(value: sliderValue.value,min: 0.15,max:0.5, onChanged: (val){ sliderValue.value = val; } ).positioned(bottom: 0, left: 0, right: 0),)//fine Obx
              
              ].stack(alignment: Alignment.center, clip: Clip.none)
              //in order to dismiss animation even out of the cardstack
              .box.make().w(context.width)
              .onTap(() {
                if( !_selected_RowAnimShouldDisplay.value ) 
                  ctrlRotateRow.forward().whenComplete(() => _selected_RowAnimShouldDisplay.value = true  );
                else 
                  ctrlRotateRow.reverse().whenComplete(() => _selected_RowAnimShouldDisplay.value = false );})
              
              
            );
        
          })
        ).onTap(() {
                if( !_selected_RowAnimShouldDisplay.value ) 
                  ctrlRotateRow.forward().whenComplete(() => _selected_RowAnimShouldDisplay.value = true  );
                else 
                  ctrlRotateRow.reverse().whenComplete(() => _selected_RowAnimShouldDisplay.value = false );})
      ;
    })
  );
  }
}

class CardWidget extends AnimatedWidget {
  CardWidget({ required this.height , required this.card, required this.percent, required this.depth, this.onCardSelected, this.verticalFactor = 0, required Animation<double> animation }) : super(listenable: animation);

  final double height;
  final Card3D card;
  final double percent;
  final int depth;
  final ValueChanged<Card3D>? onCardSelected;
  final int verticalFactor;
  Animation<double> get animation => listenable as Animation<double>;
  

  @override
  Widget build(BuildContext context) {// CArdWidget3D è stato sostituito dal  
    return  Hero(
      tag: card.title,
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          //50 => depth factor
          ..translate(0.0, verticalFactor * animation.value * context.height ,depth*50 ),
          child:  PhysicalModel(
        color: Colors.white,
        elevation: 10, 
        borderRadius: BorderRadius.circular(15),
        child:Image.network(card.image,fit: BoxFit.cover).cornerRadius(15).h(height)))
        .opacity(value: verticalFactor == 0 ? 1 : 1- animation.value)
        //otap findamentale per absorbPointer poco piu su
        .onTap(() {onCardSelected!(card);})
        //height /4 => BottomMargin for slider not to overlap stack o PHYS images
        .positioned(top: height + -depth * height  /2.0 * percent -height /4, left: 0, right: 0),
    )
      
    ;
    
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