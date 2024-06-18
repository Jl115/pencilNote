import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pencil_kit/pencil_kit.dart';
import 'package:pencilkit_note_taking/models/draw_model.dart';
import 'dart:convert';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(drawModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PencilKit'),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () => model.controller.show(),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => model.controller.hide(),
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () => model.controller.undo(),
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: () => model.controller.redo(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => model.controller.clear(),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.save),
                      onPressed: () async {
                        final Directory documentDir =
                            await getApplicationDocumentsDirectory();
                        final String pathToSave = '${documentDir.path}/drawing';
                        try {
                          final data = await model.controller
                              .save(uri: pathToSave, withBase64Data: true);
                          Fluttertoast.showToast(
                            msg: "Save Success to [$pathToSave]",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                        } catch (e) {
                          Fluttertoast.showToast(
                            msg: "Save Failed to [$pathToSave]",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                        }
                      },
                      tooltip: "Save",
                    ),
                    // Weitere Buttons hier ...
                  ],
                ),
              ),
              // Weitere UI-Elemente hier ...
              Expanded(
                child: PencilKit(
                  onPencilKitViewCreated: (controller) =>
                      model.controller = controller,
                  alwaysBounceVertical: false,
                  alwaysBounceHorizontal: true,
                  isRulerActive: false,
                  drawingPolicy: PencilKitIos14DrawingPolicy.anyInput,
                  backgroundColor: Colors.yellow.withOpacity(0.1),
                  isOpaque: false,
                  toolPickerVisibilityDidChange: (isVisible) =>
                      print('toolPickerVisibilityDidChange $isVisible'),
                  toolPickerIsRulerActiveDidChange: (isRulerActive) =>
                      print('toolPickerIsRulerActiveDidChange $isRulerActive'),
                  toolPickerFramesObscuredDidChange: () =>
                      print('toolPickerFramesObscuredDidChange'),
                  toolPickerSelectedToolDidChange: () =>
                      print('toolPickerSelectedToolDidChange'),
                  canvasViewDidBeginUsingTool: () =>
                      print('canvasViewDidBeginUsingTool'),
                  canvasViewDidEndUsingTool: () =>
                      print('canvasViewDidEndUsingTool'),
                  canvasViewDrawingDidChange: () =>
                      print('canvasViewDrawingDidChange'),
                  canvasViewDidFinishRendering: () =>
                      print('canvasViewDidFinishRendering'),
                ),
              ),
            ],
          ),
          if (model.base64Image.isNotEmpty)
            Positioned(
              bottom: 128,
              right: 24,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black12),
                ),
                child: Image.memory(base64Decode(model.base64Image)),
              ),
            ),
        ],
      ),
    );
  }
}
