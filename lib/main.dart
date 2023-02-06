import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:yoo/controller/controller.dart';
import 'package:yoo/firebase_options.dart';
import 'package:yoo/screens/diegoVelop/popUpConsole/popUpConsole_screen.dart';
import 'package:yoo/screens/diegoVelop/rotate/rotate_screen.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/L/anim.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/L/anim_test_fl.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/L/official.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/L/official_theory_diegovelop.dart';
import 'package:yoo/screens/diegoVelop/rotationDissolveCard/anim2.dart';
import 'package:yoo/screens/diegoVelop/sideMenu/main.dart';
import 'package:yoo/screens/diegoVelop/snakeButtonCustom/customButton.dart';
import 'package:yoo/screens/fliper_screens.dart';
import 'package:yoo/screens/hotel/hotel_screen.dart';
import 'package:yoo/screens/proj/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //LocationPermission locationPermission = await Geolocator.requestPermission();
  await Firebase.initializeApp(
    //FlutterFire CLI - TODO - needs to be configured by it
    options: DefaultFirebaseOptions.currentPlatform
    )
  .then((value) {
    print("Main/ProjName: "+value.options.projectId);
    Get.put(Controller());
  }).then((value) => runApp(const MyApp()) );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.light : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
 
  var _counter = 0.obs;

  void _incrementCounter() {
    
      
      _counter++;
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("seeeeex"),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx( () => Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )),
            //**** */
            "Sign in w GOOGLE".text.xl3.make().onTap(() {
                signInWithGoogle();        
              }),

              50.heightBox,
              "To Home Screen".text.amber700.xl3.bold.hairLine.make().onInkTap(() { Get.to(HomeScreen()); }),
              12.heightBox,
              
              "SideMenu".text.xl3.lime600.make().onInkTap(() { Get.to(()=> MainSideMenu()); }),
              13.heightBox,

              "to Prova screen".text.xl4.make().onTap(() {Get.to(()=> HotelHomeScreen()); }),

              "to Animmm".text.xl4.make().onTap(() {Get.to(()=> AnimScreen()); }),
              "to Animmm 22222".text.xl4.make().onTap(() {Get.to(()=> Anim2Screen()); }),
              "to Animmm OFFIZIEL".text.xl4.make().onTap(() {Get.to(()=> CardsHome()); }),
              "to Anim Theory OFFIZIEL".text.xl2.make().onTap(() {Get.to( ()=> AnimTheoryOffiziel());}),

              100.heightBox,

              "to FlipprScreenSide".text.xl4.make().onTap(() {Get.to(() => FliperScreen());}),
              "to ANimTest".text.xl5.make().onTap(() {Get.to(()=> AnimatedContainerAppe());}),

              100.heightBox,

              "CustonSnakeButton".text.black.xl3.make().onTap(() {Get.to(()=> CustonSnakeButtonScreen());}),
              
              100.heightBox,

              "Popup console".text.black.xl3.make().onTap(() {Get.to(()=> MainExpandableNavBar());}),

              100.heightBox,

              "Rotate Screen".text.black.xl3.make().onTap(() {Get.to(()=> RotateScreen());}),

              100.heightBox,

              //-----
          ],
        ).scrollVertical(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

// Method
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId ).signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  try {
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }catch(e) {debugPrint(e.toString());}
  return Future.delayed(1.milliseconds);
}
