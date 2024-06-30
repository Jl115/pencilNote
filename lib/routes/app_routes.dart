import 'package:get/get.dart';
import 'package:pencilkit_note_taking/views/folder_picker_view.dart';
import 'package:pencilkit_note_taking/views/home_screen.dart';
import 'package:pencilkit_note_taking/views/note_view.dart';

// Define the All Routes in the app
final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/note-view', page: () => NoteView()),
  GetPage(name: '/pickFolder', page: () => FolderPickerView())
];
