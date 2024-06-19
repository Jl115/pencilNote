import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController {
  static final CounterController _singleton = CounterController._internal();
  final GetStorage _storage = GetStorage();

  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  factory CounterController() {
    return _singleton;
  }

  CounterController._internal() {
    count1.value = _storage.read('count1') ?? 0;
    count2.value = _storage.read('count2') ?? 0;
    count3.value = _storage.read('count3') ?? 0;
  }

  void incrementCount1() {
    count1++;
    count2.value = count1.value * 2;
    count3.value = count1.value * 3;
    _saveCounts();
  }

  void incrementCount2() {
    count2++;
    count1.value = count2.value ~/ 2;
    count3.value = count2.value * 3;
    _saveCounts();
  }

  void incrementCount3() {
    count3++;
    count1.value = count3.value ~/ 3;
    count2.value = count3.value ~/ 2;
    _saveCounts();
  }

  void _saveCounts() {
    _storage.write('count1', count1.value);
    _storage.write('count2', count2.value);
    _storage.write('count3', count3.value);
  }
}
