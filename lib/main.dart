import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pencilkit_note_taking/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(PencilNote());
}

class PencilNote extends StatelessWidget {
  const PencilNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note App',
      initialRoute: '/',
      //Page Defining
      getPages: appRoutes,
    );
  }
}
