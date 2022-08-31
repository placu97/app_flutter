import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ScrollController useScrollC(AnimationController animC) {
  
  ScrollController scrlC = ScrollController();
  scrlC.addListener(() {
    switch  (scrlC.position.userScrollDirection) {
      
      // scroll verso il bassso
      case ScrollDirection.forward :
        //esce bo ma l'animazione procede in avanti
        animC.forward();
        break;
      
      case ScrollDirection.reverse : 
        animC.reverse();
        break;

      case ScrollDirection.idle :
        break;
    }
  });

  return scrlC;
  
}