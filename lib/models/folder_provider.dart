/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models.dart';

class FolderProvider extends StateNotifier<List<Folder>> {
  FolderProvider() : super([]);

  List<Folder> get folders => state;

  void addFolder(Folder folder) {
    state = [...state, folder];
  }

  void removeFolder(Folder folder) {
    state = state.where((f) => f != folder).toList();
  }
}

final folderProvider =
    StateNotifierProvider<FolderProvider, List<Folder>>((ref) {
  return FolderProvider();
});
 */