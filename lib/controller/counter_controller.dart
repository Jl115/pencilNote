import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import '../models/folder.dart';

class CounterController extends GetxController {
  final GetStorage _storage = GetStorage();
  Folder folder = Folder(path: '');

  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  CounterController() {
    count1.value = _storage.read('count1') ?? 0;
    count2.value = _storage.read('count2') ?? 0;
    count3.value = _storage.read('count3') ?? 0;
  }

  Future<void> incrementCount1() async {
    print(folder.name ?? 'Folder Name is null');
    folder.name = 'Folder 1qewq';
    print('The new Name of the Folder is${folder.name}');
    count2.value = count1.value * 2;
    count3.value = count1.value * 3;
    var params = const OpenFileDialogParams(
      dialogType: OpenFileDialogType.document,
      sourceType: SourceType.photoLibrary,
    );
    final filePath = await FlutterFileDialog.pickFile(params: params);
    if (filePath != null) {
      print('Selected file: $filePath');
      // Hier kannst du den Datei-Pfad weiter verarbeiten oder anzeigen
    }
    _saveCounts();
  }

  void incrementCount2() {
    count2++;
    count1.value = count2.value ~/ 2;
    count3.value = count2.value * 3;
    Get.toNamed('/note-view'); // Verwende Get.toNamed für die Navigation
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
