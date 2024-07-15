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

  void addFolder(String folderName) {
    if (selectedFolder.value != null) {
      var newPath = '${selectedFolder.value?.path}/$folderName';
      print(newPath);
      var newDirectory = Directory(newPath);
      print(newDirectory);
      print(newDirectory.existsSync());
      if (!newDirectory.existsSync()) {
        print(1);
        newDirectory.createSync();
        var createdFolder = Folder(
          path: newPath,
          name: folderName,
          notes: [],
          subfolders: [],
        );
        folders.add(createdFolder);
        selectedFolder.value!.folders.add(createdFolder);
        update(); // Update the UI
      } else {
        // Handle case where folder already exists
        print('Folder already exists');
      }
    } else {
      print('No root folder selected');
    }
  }

  void removeFolder(BaseFolder folder) {
    folders.remove(folder);
  }

  void selectRootFolder(String path) {
    // Initialize the RootFolder with the selected path and subfolders
    print('Selected path: $path');

    RootFolder.initializeWithPath(path);

    var newRootFolder = RootFolder()
      ..path = path
      ..folders = _getSubfolders(path);
    print(newRootFolder.folders[0].name);
    selectedFolder.value = newRootFolder;
  }

  List<Folder> _getSubfolders(String path) {
    // Fetch the list of subfolders in the given path
    final directory = Directory(path);
    return directory.listSync().whereType<Directory>().map((dir) {
      print(dir.path);
      return Folder(
          path: dir.path,
          name: dir.path.split('/').last,
          notes: [],
          subfolders: []);
    }).toList();
  }
}
