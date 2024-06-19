import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/folder_list.dart';
import '../components/note_list.dart';
import '../models/folder_provider.dart';
import '../models/models.dart';
import 'note_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _folderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Note App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _folderController,
                    decoration: InputDecoration(
                      labelText: 'Folder Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final folderName = _folderController.text;
                    if (folderName.isNotEmpty) {
                      ref
                          .read(folderProvider.notifier)
                          .addFolder(Folder(name: folderName));
                      _folderController.clear();
                    }
                  },
                  child: Text('Add Folder'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FolderList(),
                ),
                Expanded(
                  flex: 2,
                  child: NoteList(),
                ),
                Expanded(
                  flex: 4,
                  child: NoteView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
