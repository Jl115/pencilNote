import 'package:pencilkit_note_taking/models/base/base_folder.dart';
import 'package:pencilkit_note_taking/models/folder.dart';
import 'package:pencilkit_note_taking/models/text_note.dart';
import 'dart:io';

class RootFolder extends BaseFolder {
  static final RootFolder _instance = RootFolder._internal(
    path: File('root').path,
    notes: [],
    folders: [],
  );

  factory RootFolder() {
    return _instance;
  }

  RootFolder._internal(
      {required String path,
      required List<Note> notes,
      required List<Folder> folders})
      : super(
          path: path,
        );

  @override
  void createFolder(String name) {
    // Implementation for creating a folder
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
}
