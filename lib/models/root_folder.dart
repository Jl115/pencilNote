import 'package:pencilkit_note_taking/models/base/base_folder.dart';
import 'package:pencilkit_note_taking/models/folder.dart';
import 'package:pencilkit_note_taking/models/text_note.dart';
import 'dart:io';

class RootFolder extends BaseFolder {
  static final RootFolder _instance = RootFolder._internal(
    path: '',
    notes: [],
    folders: [],
  );

  List<Note> notes;
  List<Folder> folders;

  factory RootFolder() {
    return _instance;
  }

  RootFolder._internal({
    required String path,
    required this.notes,
    required this.folders,
  }) : super(path: path);

  @override
  void createFolder(String name) {
    final newFolderPath = Directory('$path/$name');
    if (!newFolderPath.existsSync()) {
      newFolderPath.createSync();
      folders.add(Folder(
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
      path = newFolderPath.path;
    }
  }

  @override
  void deleteFolder(String name) {
    final folderToDelete = Directory('$path/$name');
    if (folderToDelete.existsSync()) {
      folderToDelete.deleteSync(recursive: true);
      folders.removeWhere((folder) => folder.path == folderToDelete.path);
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

  static void initializeWithPath(String path) {
    final directory = Directory(path);
    final subfolders = directory
        .listSync()
        .whereType<Directory>()
        .map((dir) => Folder(
              path: dir.path,
              notes: [],
              subfolders: [],
              name: '',
            ))
        .toList();

    _instance.path = path;
    _instance.folders = subfolders;
    _instance.notes = []; // Load notes if needed
  }
}
