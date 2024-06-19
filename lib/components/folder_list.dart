import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/folder_provider.dart';

class FolderList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folders = ref.watch(folderProvider);
    return ListView.builder(
      itemCount: folders.length,
      itemBuilder: (context, index) {
        final folder = folders[index];
        return ListTile(
          title: Text(folder.name),
          onTap: () {
            // Folder selection logic
          },
        );
      },
    );
  }
}
