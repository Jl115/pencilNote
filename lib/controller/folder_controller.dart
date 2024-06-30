import 'package:get/get.dart';
import 'package:pencilkit_note_taking/models/base/base_folder.dart';
import 'package:pencilkit_note_taking/models/folder.dart';
import 'package:pencilkit_note_taking/models/root_folder.dart';
import 'dart:io';

class FolderController extends GetxController {
  var folders = <BaseFolder>[].obs;
  var selectedFolder = Rx<RootFolder?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchFolders();
  }

  void fetchFolders() {
    // Implementation for fetching folders if necessary
  }

  void addFolder(BaseFolder folder) {
    folders.add(folder);
  }

  void removeFolder(BaseFolder folder) {
    folders.remove(folder);
  }

  void selectRootFolder(String path) {
    // Initialize the RootFolder with the selected path and subfolders
    print('Selected path: $path');
    var newRootFolder = RootFolder()
      ..path = path
      ..folders = _getSubfolders(path);
    print(newRootFolder);
    selectedFolder.value = newRootFolder;
  }

  List<Folder> _getSubfolders(String path) {
    // Fetch the list of subfolders in the given path
    final directory = Directory(path);
    return directory.listSync().whereType<Directory>().map((dir) {
      return Folder(
          path: dir.path,
          name: dir.path.split('/').last,
          notes: [],
          subfolders: []);
    }).toList();
  }
}
