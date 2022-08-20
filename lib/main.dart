import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:yoo/controller/controller.dart';
import 'package:yoo/firebase_options.dart';

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
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
              try {
                signInWithGoogle();
              }catch(w){print(w);}
              })

          ],
        ),
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
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
