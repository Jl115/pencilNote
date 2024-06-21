import 'package:pencilkit_note_taking/models/text_note.dart';

abstract class BaseFolder {
  String name;
  String path;
  List<Note> notes;

  BaseFolder({required this.name, required this.path, required this.notes});

  createFolder(String name);
  changeFolderName(String name);
  deleteFolder(String name);
  switchFolderLocation(String path);
}
