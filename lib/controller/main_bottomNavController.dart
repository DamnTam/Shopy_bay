 import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainBottomNavController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    update();
  }
  void backToHome(){
    changeIndex(0);
    update();
  }
 }