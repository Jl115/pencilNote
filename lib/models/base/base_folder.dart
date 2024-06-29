import 'package:pencilkit_note_taking/models/text_note.dart';

/* BaseFolder is an abstract class that defines the properties and methods that a folder should have.  */
abstract class BaseFolder {
  String path;

  BaseFolder({required this.path});

  createFolder(String name);
  changeFolderName(String name);
  deleteFolder(String name);
  switchFolderLocation(String path);
}
