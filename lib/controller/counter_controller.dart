import 'package:get/get.dart';

class CounterController extends GetxController{

  int counter=1;
  void increment(){
    counter++;
    update();
  }
  void decrement(){
    if(counter>1) {
      counter--;
    }
    update();
  }

}