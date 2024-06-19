import 'package:get/get.dart';

class CounterController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  void incrementCount1() {
    count1++;
    count2.value = count1.value * 2;
    count3.value = count1.value * 3;
  }

  void incrementCount2() {
    count2++;
    count1.value = count2.value ~/ 2;
    count3.value = count2.value * 3;
  }

  void incrementCount3() {
    count3++;
    count1.value = count3.value ~/ 3;
    count2.value = count3.value ~/ 2;
  }
}
