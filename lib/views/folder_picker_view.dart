import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pencilkit_note_taking/controller/folder_controller.dart';
import 'package:pencilkit_note_taking/models/root_folder.dart';

class FolderPickerView extends StatefulWidget {
  @override
  _FolderPickerViewState createState() => _FolderPickerViewState();
}

class _FolderPickerViewState extends State<FolderPickerView> {
  Directory? selectedDirectory;
  String? createdDirectoryPath;

  //controllers
  final FolderController folderController = Get.find<FolderController>();

  Future<void> pickDirectory() async {
    String? selectedDirectoryPath =
        await FilePicker.platform.getDirectoryPath();
    print(selectedDirectoryPath);
    if (selectedDirectoryPath != null) {
      setState(() {
        selectedDirectory = Directory(selectedDirectoryPath);
        print(selectedDirectory);
        folderController.selectedFolder.value = RootFolder();
        createdDirectoryPath = selectedDirectoryPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Select or Create a Root Folder',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Selected Directory: ${selectedDirectory?.path.split('/').last ?? 'None'}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //* Pick Root Directory Button
                      ElevatedButton(
                        onPressed: pickDirectory,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('Select Folder'),
                      ),
                      /* if (selectedDirectory != null)
                  Text('Selected Directory: ${selectedDirectory!.path}'), */
                      SizedBox(height: 10),
                      //* Submitted Directory Path Button
                      ElevatedButton(
                        onPressed: () {
                          if (createdDirectoryPath != null) {
                            folderController
                                .selectRootFolder(createdDirectoryPath!);
                            Get.offNamed('/folder-detail');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 30),
                          backgroundColor: Colors.deepPurpleAccent[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
