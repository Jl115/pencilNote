import 'package:pencilkit_note_taking/models/base/base_folder.dart';
import 'package:pencilkit_note_taking/models/text_note.dart';

class Folder extends BaseFolder {
  Folder(
      {required String name, required String path, required List<Note> notes})
      : super(name: name, path: path, notes: notes);

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
