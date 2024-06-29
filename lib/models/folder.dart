import 'dart:io';

import 'package:pencilkit_note_taking/models/base/base_folder.dart';
import 'package:pencilkit_note_taking/models/text_note.dart';

class Folder extends BaseFolder {
  Folder({
    required String path,
  }) : super(path: path);

  var _name;

  /// Creates a folder with the given [name].
  @override
  void createFolder(String name) {
    // Implementation for creating a folder
    print(name);
    print(Directory.current.path);
  }

  @override
  void changeFolderName(String name) {
    // Implementation for changing the folder name
  }

  @override
  void deleteFolder(String name) {
    // Implementation for deleting a folder
  }

  @override
  void switchFolderLocation(String path) {
    // Implementation for switching the folder location
  }

  set name(String name) {
    _name = name;
  }

  String get name => _name ?? 'Folder Name is null';
}
