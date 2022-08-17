import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yoo/controller/firebase.dart';

class Controller extends GetxController {
  static Controller controller = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    //print(firebaseUser);
  }

  _setInitialScreen(User? user) {
    // if (user == null) {
    //   Get.offAll( () => AccediScreen());
    // } else {

    //   Get.offAll(()=> HomeScreen(),transition: Transition.fadeIn);
      
    // }
  }
}