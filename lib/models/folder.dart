import 'dart:io';

import 'package:pencilkit_note_taking/models/base/base_folder.dart';
import 'package:pencilkit_note_taking/models/text_note.dart';

class Folder extends BaseFolder {
  String _name;
  List<Note> notes;
  List<Folder> subfolders;

  Folder({
    required String path,
    required this.notes,
    required this.subfolders,
    required String name,
  })  : _name = path.split('/').last,
        super(path: path);

  @override
  void createFolder(String name) {
    final newFolderPath = Directory('$path/$name');
    if (!newFolderPath.existsSync()) {
      newFolderPath.createSync();
      subfolders.add(Folder(
        path: newFolderPath.path,
        notes: [],
        subfolders: [],
        name: '',
      ));
    }
  }

  @override
  void changeFolderName(String newName) {
    final newFolderPath = Directory('$path/../$newName');
    final currentDir = Directory(path);
    if (currentDir.existsSync() && !newFolderPath.existsSync()) {
      currentDir.renameSync(newFolderPath.path);
      _name = newName;
    }
  }

  @override
  void deleteFolder(String name) {
    final folderToDelete = Directory('$path/$name');
    if (folderToDelete.existsSync()) {
      folderToDelete.deleteSync(recursive: true);
      subfolders.removeWhere((folder) => folder.path == folderToDelete.path);
    }
  }

  @override
  void switchFolderLocation(String newPath) {
    final newFolderPath = Directory(newPath);
    if (!newFolderPath.existsSync()) {
      Directory(path).renameSync(newPath);
      path = newPath;
    }
  }

  set name(String name) {
    _name = name;
  }

  String get name => _name;
}
