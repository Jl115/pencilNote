import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencilkit_note_taking/controller/folder_controller.dart';
import 'package:pencilkit_note_taking/models/folder.dart';

class Sidebar extends StatelessWidget {
  final RxBool isVisible;
  final RxDouble navBarWidth = 200.0.obs;
  final FolderController folderController = Get.find<FolderController>();

  Sidebar({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height - 100;

    // Function to build list of folders and notes
    List<Widget> listFolders() {
      if (folderController.selectedFolder.value == null) {
        return [];
      }

      // Combine folders and notes into a single list
      List<dynamic> items = [
        ...folderController.selectedFolder.value!.folders,
        ...folderController.selectedFolder.value!.notes,
      ];

      return items.map((item) {
        // Determine if the item is a folder or a note
        bool isFolder = item is Folder;

        return ListTile(
          leading: Icon(isFolder ? Icons.folder : Icons.insert_drive_file),
          title: Text(isFolder ? item.name : item.title),
          onTap: () {
            print(
                'Tapped on ${isFolder ? 'folder' : 'note'}: ${isFolder ? item.name : item.title}');
          },
        );
      }).toList();
    }

    // Function to show dialog for creating folder or note
    Future<void> showCreateDialog(BuildContext context, bool isFolder) async {
      TextEditingController nameController = TextEditingController();

      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create New ${isFolder ? 'Folder' : 'Note'}'),
            content: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: '${isFolder ? 'Folder' : 'Note'} Name'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Create'),
                onPressed: () {
                  if (isFolder) {
                    folderController.addFolder(nameController.text);
                  } else {
                    folderController.addNote(nameController.text);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // Widget for the bottom icon bar
    Widget bottomIconBar() {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 50,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () => showCreateDialog(context, false),
                  icon: Icon(Icons.note_add),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () => showCreateDialog(context, true),
                  icon: Icon(Icons.create_new_folder),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Obx(
      () => Row(
        children: [
          // Expanded sidebar
          if (navBarWidth.value > 80)
            Stack(
              children: [
                Container(
                  width: navBarWidth.value,
                  color: Colors.grey[200],
                  height: containerHeight,
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: listFolders(), // Use the combined list here
                  ),
                ),
                bottomIconBar(),
                // Resize handle
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      navBarWidth.value = (navBarWidth.value + details.delta.dx)
                          .clamp(0.0, 500.0);
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.resizeLeftRight,
                      child: Container(
                        height: 50,
                        width: 20,
                        color: Colors.transparent,
                        child: Center(
                          child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          // Collapsed sidebar button
          if (navBarWidth.value <= 80)
            IconButton(
              onPressed: () {
                navBarWidth.value += 120;
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
        ],
      ),
    );
  }
}
