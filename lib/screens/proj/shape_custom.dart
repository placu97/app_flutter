import 'package:flutter/material.dart';

class ExmplCustomPainter extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    
        
         
    Path path0 = Path();
    path0.moveTo(size.width*0.3700000,size.height*0.2240000);
    path0.lineTo(size.width*0.4088889,size.height*0.2360000);
    path0.lineTo(size.width*0.4166667,size.height*0.3400000);
    path0.lineTo(size.width*0.3977778,size.height*0.4200000);
    path0.lineTo(size.width*0.3922222,size.height*0.4960000);
    path0.lineTo(size.width*0.3477778,size.height*0.5640000);
    path0.lineTo(size.width*0.2977778,size.height*0.6200000);
    path0.lineTo(size.width*0.2500000,size.height*0.6500000);
    path0.lineTo(size.width*0.2022222,size.height*0.6300000);
    path0.lineTo(size.width*0.1411111,size.height*0.6400000);
       path0.lineTo(size.width*0.1222222,size.height*0.6140000);
    path0.lineTo(size.width*0.1022222,size.height*0.5940000);
    path0.lineTo(size.width*0.0722222,size.height*0.5240000);
    path0.lineTo(size.width*0.0522222,size.height*0.4460000);
    path0.lineTo(size.width*0.0333333,size.height*0.3640000);
    path0.lineTo(size.width*0.0333333,size.height*0.2640000);
    path0.lineTo(size.width*0.0444444,size.height*0.1900000);
    path0.lineTo(size.width*0.0533333,size.height*0.1560000);
    path0.lineTo(size.width*0.0800000,size.height*0.1140000);
    path0.lineTo(size.width*0.1188889,size.height*0.1000000);
    path0.lineTo(size.width*0.1744444,size.height*0.0800000);
    path0.lineTo(size.width*0.2222222,size.height*0.0700000);
    path0.lineTo(size.width*0.1718222,size.height*0.4367200);
    path0.lineTo(size.width*0.3166667,size.height*0.1340000);
    path0.lineTo(size.width*0.3522222,size.height*0.1600000);
    path0.lineTo(size.width*0.3644444,size.height*0.2060000);
    path0.lineTo(size.width*0.3700000,size.height*0.2240000);
    path0.close();
    return path0;
  
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
  
  
}
