import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CustonSnakeButtonScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "CustomSnakeButton".text.make()),
      backgroundColor: Colors.grey[700],
      body: [

        SnakeButton(child: "Hello world".text.white.make(),),

      ].vStack(crossAlignment: CrossAxisAlignment.stretch,axisSize: MainAxisSize.max).p(60),
    );
  }
}

class SnakeButton extends HookWidget {
  const SnakeButton({super.key, required this.child, this.millisecs=888});

  final Widget child;
  final int millisecs;

 

  @override
  Widget build(BuildContext context) {
    final animCtrl = useAnimationController(duration: millisecs.milliseconds);
    
    return CustomPaint(painter: _SnakePainter(animation: animCtrl),child: child.centered().p(18))
      .onInkTap(() {animCtrl.forward().whenComplete(() => animCtrl.reset());});
  }
}
class _SnakePainter extends CustomPainter {

  final Animation animation;
  final Color snakeColor;
  final Color borderColor;
  final double borderWidth;
  
  _SnakePainter({required this.animation, this.snakeColor=Colors.purple, this.borderColor=Colors.white, this.borderWidth=6})
  :super(repaint: animation);

  void paint(  canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint() ..shader = SweepGradient(colors: [snakeColor,Colors.transparent], stops: [0.7,1.0],
      startAngle: 0.0, endAngle: vector.radians(90), transform: GradientRotation(vector.radians( 360.0 * animation.value )) 
      ).createShader(rect);
    final path = Path.combine(PathOperation.xor, Path()..addRect(rect), Path()..addRect(rect.deflate( borderWidth )));
    //path.addRect(rect);
    
    //white border
    canvas.drawRect(rect.deflate(borderWidth /2), Paint()..color= Colors.white ..strokeWidth=borderWidth ..style= PaintingStyle.stroke);
    
    canvas.drawPath(path, paint);
   

    
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

