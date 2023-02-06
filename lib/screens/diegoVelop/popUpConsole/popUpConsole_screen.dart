import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

const _cardColor = Color(0XFF5F40FB);
const _maxHeight = 350.0;
const _minHeight = 70.0;

class MainExpandableNavBar extends HookWidget {

  final _expanded = false.obs;

  @override
  Widget build(BuildContext context) {
    
    final animctrl = useAnimationController(duration: 888.milliseconds);

    final menuWidth = context.percentWidth * 50;
    
    return Scaffold(
      
      backgroundColor: Colors.grey[800],
      extendBody: true,
      body: ListView.builder(itemCount: 5, itemBuilder: ((context, index) {
        
        return VxBox().withRounded(value: 20).height(300).color(Colors.primaries[index % Colors.primaries.length]).make()
          .p20();

      })),
      bottomNavigationBar: AnimatedBuilder(
        animation: animctrl,
        builder: (context,snapshot) {
          return [
            _expanded.value ? _buildExpandedContent() .box.color(_cardColor).withRounded(value: lerpDouble(0.0, 20.0, animctrl.value)!).make()
            .positioned(height: lerpDouble(_minHeight, _maxHeight, animctrl.value),left: lerpDouble(context.width/2 - menuWidth/2, 0, animctrl.value),width: lerpDouble(menuWidth, context.width, animctrl.value), bottom: lerpDouble(40.0, 0.0, animctrl.value))
            : _buildMenuContent() .box.color(Colors.red).withRounded(value: 20).make() .positioned(height: _minHeight,width: menuWidth,left: context.width/2 - menuWidth/2,bottom: 40)
            // _buildMenuContent()  .onTap(() { }) .box.color(Colors.red).withRounded(value: 20).make()
            // .positioned(height: _minHeight,width: menuWidth,left: context.width/2 - menuWidth/2,bottom: 40)
            
          ].stack().onTap(() {
            _expanded.value = !_expanded.value ; 
            if (_expanded.value)
              animctrl.forward();
            else
              animctrl.reverse(); });
        }
      ),
    );
  }

  Widget _buildExpandedContent() {
    return [
      VxBox().width(80).height(80).color(Colors.black).make(),
      15.heightBox,
      "Last Century".text.white.minFontSize(12).make(),
      15.heightBox,
      "Bloody Tear".text.white.minFontSize(20).make(),
      20.heightBox,
      [
        Icon(Icons.shuffle,color: Colors.white,),Icon(Icons.pause,color: Colors.white),Icon(Icons.playlist_add,color: Colors.white)
      ].hStack(alignment: MainAxisAlignment.spaceEvenly,axisSize: MainAxisSize.max)
    ].vStack(axisSize: MainAxisSize.max).p20();
  }

  Widget _buildMenuContent() {
    return [
      Icon(Icons.calendar_today_sharp,color: Colors.white,),Icon(Icons.calendar_today,color: Colors.white),Icon(Icons.calendar_today_sharp,color: Colors.white)   
    ].hStack(alignment: MainAxisAlignment.spaceEvenly,axisSize: MainAxisSize.max);
  }
}
