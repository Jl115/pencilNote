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
  final FolderController folderController = Get.put(FolderController());

  Directory? selectedDirectory;
  String? createdDirectoryPath;

  Future<void> pickDirectory() async {
    String? selectedDirectoryPath =
        await FilePicker.platform.getDirectoryPath();

    if (selectedDirectoryPath != null) {
      setState(() {
        selectedDirectory = Directory(selectedDirectoryPath);
        RootFolder.initializeWithPath(selectedDirectoryPath);
        folderController.selectedFolder.value = RootFolder();
      });
    }
  }

  Future<void> createRootDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);

    final newDirectory = Directory('${directory.path}/NewFolder');
    print(newDirectory.path);
    print(selectedDirectory?.path.split('/').last);
    if (selectedDirectory != null) {
      print('Directory already exists at ${newDirectory.path}');
    } else {
      await newDirectory.create();
      setState(() {
        createdDirectoryPath = newDirectory.path;
        RootFolder.initializeWithPath(newDirectory.path);
        folderController.selectedFolder.value = RootFolder();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
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
                      //* Create Root Directory Button
                      ElevatedButton(
                        onPressed: createRootDirectory,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('Create Folder'),
                      ),
                      SizedBox(height: 10),

                      //* Submitted Directory Path Button
                      ElevatedButton(
                        onPressed: createRootDirectory,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 30),
                          backgroundColor: Colors.deepPurpleAccent[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                      /* if (createdDirectoryPath != null)
                  Text('Created Directory: $createdDirectoryPath'), */
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
