import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class AnimScreen extends HookWidget {
  
  // ScrollController scrlC;

  
  // void initState() {
  //   scrlC = ScrollController();
  // }
  
@override
  Widget build(BuildContext context) {
    
    final animC = useAnimationController(duration: kThemeAnimationDuration, initialValue: 1,);
    final scrlCtrl = useScrollController();
    useEffect( () {
      debugPrint("on initState");
      return () { debugPrint("onDispose"); }; }, [] 
    );
    useEffect((){ 
      //
      scrlCtrl.addListener(() {
        print("ok: ${scrlCtrl.offset}");
      });
      (){} ; (){}; (){}; }, [] 
    );

    
    

    return Scaffold(
      appBar: AppBar(title: "Anim Screen".text.black.make(),elevation: 0,backgroundColor: Vx.white),
      
      body: 
      // [
      //   for (int i=0; i<10; i++)
      //   VxCard( VxBox().red300.make().wh(200, 200)).make().onTap(() { }),
      // ].vStack().scrollVertical(controller: scrlCtrl),

      // AnimatedSize(
      //     duration: 1.seconds,
      //     curve: Curves.fastOutSlowIn,
          
      //     child: Image.network("https://picsum.photos/800/1200",fit: BoxFit.cover,).h(context.height),
      // ).centered(),

      [
        CardsBody().expand(flex: 3),

        Container(
          child: CardsHorizontal(),
          color: Colors.white,
        ).expand(flex: 2),

        

      ].vStack()

    );
  }
}
/*
Widget.animate()
*/

class CardsHorizontal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cardList = [String,String,String];
    return [
      "Recently played".text.make().p12(),

      ListView.builder(
        itemCount: cardList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
        final card = cardList[index];
        return Card3DWidget();
      })).expand() 
      
    ].vStack();
  }
}

class Card3DWidget extends StatelessWidget {
  const Card3DWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 8,
      child:  Image.network("https://picsum.photos/300/300",fit: BoxFit.cover,).cornerRadius(15).p(10)
    );
  }
}

class CardsBody extends StatelessWidget {

  var sliderValue = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Obx(()=>[

         ...List.generate(4, (index) => Card3DItem(height: constraints.maxHeight, percent: sliderValue.value) 
        ).reversed ,//Card3DItem

       Slider(value: sliderValue.value, onChanged: (val){ sliderValue.value = val; })
       .positioned(bottom: 0,left: 0,right: 0)
       
      ].stack() )
      .backgroundColor(Colors.red).h(constraints.maxHeight).w(constraints.maxWidth * 0.45);
      
    }

    ));
  }
}//CardsBody

class Card3DItem extends StatelessWidget {
  const Card3DItem({Key? key, required this.height, required this.percent, }) : super(key: key);

  final double height;
  final double percent;

  
    @override
    Widget build(BuildContext context) {

      print(height);
      
      return Positioned(
        left: 0,
        right: 0,
        top: height + 30 * percent,
        child: SizedBox(
          height: height,
          child: Card3DWidget(),
        ) );
      // return Card3DWidget()
      // .h(height)
      // .positioned(left: 0, right: 0,top: height + 30 * percent)
      // ;
    }
  }//Card3DItem



//____________________________________________
class ImgScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}