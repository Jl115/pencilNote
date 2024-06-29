// import 'package:get_storage/get_storage.dart';
// import 'package:pencilkit_note_taking/controller/pencilkit_controller.dart';
// import 'package:pencilkit_note_taking/models/base/base_note.dart';

// class DrawNote extends BaseNote {
//   final GetStorage storage = GetStorage();
//   final PencilKitControler pencilKitControler;

//   DrawNote({
//     required String title,
//     required String content,
//     required DateTime dateCreated,
//     required DateTime dateModified,
//     required String folderPath,
//     required String notePath,
//     required this.pencilKitControler,
//   }) : super(
//           title: title,
//           content: content,
//           dateCreated: dateCreated,
//           dateModified: dateModified,
//           folderPath: folderPath,
//           notePath: notePath,
//         );

//   @override
//   void createNote() {
//     /*  storage.write(notePath, {
//       'title': title,
//       'content': content,
//       'dateCreated': dateCreated.toIso8601String(),
//       'dateModified': dateModified.toIso8601String(),
//       'folderPath': folderPath,
//       'notePath': notePath,
//       'drawingData': pencilKitControler.
//           .getDrawing(), // Annahme: getDrawing gibt die Zeichnungsdaten zurück
//     }); */
//   }

//   @override
//   void changeNoteTitle(String newTitle) {
//     title = newTitle;
//     dateModified = DateTime.now();
//     updateNote();
//   }

//   @override
//   void changeNoteContent(String newContent) {
//     content = newContent;
//     dateModified = DateTime.now();
//     updateNote();
//   }

//   @override
//   void deleteNote() {
//     storage.remove(notePath);
//   }

//   @override
//   void switchNoteLocation(String newFolderPath) {
//     folderPath = newFolderPath;
//     dateModified = DateTime.now();
//     updateNote();
//   }

//   void updateNote() {
//     /*  storage.write(notePath, {
//       'title': title,
//       'content': content,
//       'dateCreated': dateCreated.toIso8601String(),
//       'dateModified': dateModified.toIso8601String(),
//       'folderPath': folderPath,
//       'notePath':
//           notePath, /* 
//       'drawingData': pencilKitControler.pencilKitControler.getDrawing(), */
//     }); */
//   }

//   static DrawNote fromStorage(
//       String notePath, PencilKitControler pencilKitControler) {
//     final GetStorage storage = GetStorage();
//     var noteData = storage.read(notePath);

//     if (noteData == null) {
//       throw Exception('Note not found');
//     }
// /* 
//     pencilKitControler.pencilKitControler.loadDrawing(noteData[
//         'drawingData']); // Annahme: loadDrawing lädt die Zeichnungsdaten
//  */
//     return DrawNote(
//       title: noteData['title'],
//       content: noteData['content'],
//       dateCreated: DateTime.parse(noteData['dateCreated']),
//       dateModified: DateTime.parse(noteData['dateModified']),
//       folderPath: noteData['folderPath'],
//       notePath: notePath,
//       pencilKitControler: pencilKitControler,
//     );
//   }
// }
