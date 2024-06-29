// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/folder_controller.dart';
// import '../models/models.dart';

// class FolderDetailPage extends StatelessWidget {
//   final Folder folder;

//   FolderDetailPage({required this.folder});

//   final FolderController folderController = FolderController()

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(folder.name),
//       ),
//       body: ListView.builder(
//         itemCount: folder.drawNotes.length,
//         itemBuilder: (context, index) {
//           var drawNote = folder.drawNotes[index];
//           return ListTile(
//             title: Text(drawNote.name),
//             onTap: () {
//               // Handle draw note tap
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           folderController.addDrawNoteToFolder(folder);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
