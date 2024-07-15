import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencilkit_note_taking/controller/folder_controller.dart';

class Sidebar extends StatelessWidget {
  final RxBool isVisible;
  final RxDouble navBarWidth = 200.0.obs;
  final FolderController folderController = Get.find<FolderController>();

  Sidebar({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height - 100;

    List<Widget> listFolders() {
      if (folderController.selectedFolder.value == null) {
        return [];
      }

      List<Widget> items = [];

      // Add folders
      for (var folder in folderController.selectedFolder.value!.folders) {
        items.add(
          ListTile(
            leading: Icon(Icons.folder),
            title: Text(folder.name),
            onTap: () {
              print('Tapped on folder: ${folder.name}');
            },
          ),
        );
      }

      // Add notes
      for (var note in folderController.selectedFolder.value!.notes) {
        items.add(
          ListTile(
            leading: Icon(Icons.insert_drive_file),
            title: Text(note.title),
            onTap: () {
              print('Tapped on note: ${note.title}');
            },
          ),
        );
      }

      return items;
    }

    Future<void> showCreateFolderDialog(
        BuildContext context, bool isFolder) async {
      TextEditingController nameController = TextEditingController();

      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                isFolder ? Text('Create New Folder') : Text('Create New Note'),
            content: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: isFolder ? 'Folder Name' : 'Note Name'),
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

    Positioned bottomIconBar() {
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
                  onPressed: () {
                    showCreateFolderDialog(context, false);
                  },
                  icon: Icon(Icons.note_add),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    showCreateFolderDialog(context, true);
                  },
                  icon: Icon(Icons.create_new_folder),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Obx(() => Row(
          children: [
            navBarWidth.value > 80
                ? Stack(
                    children: [
                      Container(
                        width: navBarWidth.value,
                        color: Colors.grey[200],
                        height: containerHeight,
                        constraints: BoxConstraints(maxWidth: 500),
                        child: Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: listFolders(),
                            )),
                      ),
                      bottomIconBar(),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              navBarWidth.value += details.delta.dx;
                              if (navBarWidth.value >= 500) {
                                navBarWidth.value = 500;
                              }
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.resizeLeftRight,
                              child: Container(
                                height: 50,
                                width: 20,
                                color: Colors.transparent,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            navBarWidth.value <= 80
                ? IconButton(
                    onPressed: () {
                      navBarWidth.value += 120;
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  )
                : Container(),
          ],
        ));
  }
}
