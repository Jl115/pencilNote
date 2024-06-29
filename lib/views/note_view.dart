import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pencil_kit/pencil_kit.dart';
import 'package:pencilkit_note_taking/controller/pencilkit_controller.dart';

class NoteView extends StatelessWidget {
  final DrawController drawController = Get.put(DrawController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PencilKit(
              onPencilKitViewCreated: (controller) {
                drawController.controller = controller;
              },
              toolPickerVisibilityDidChange: (isVisible) {
                print('Tool picker visibility changed: $isVisible');
              },
              toolPickerIsRulerActiveDidChange: (isRulerActive) {
                print('Tool picker ruler active state changed: $isRulerActive');
              },
              toolPickerFramesObscuredDidChange: () {
                print('Tool picker frames obscured changed');
              },
              toolPickerSelectedToolDidChange: () {
                print('Tool picker selected tool changed');
              },
              canvasViewDidBeginUsingTool: () {
                print('Canvas view began using tool');
              },
              canvasViewDidEndUsingTool: () {
                print('Canvas view ended using tool');
              },
              canvasViewDrawingDidChange: () {
                print('Canvas view drawing changed');
              },
              canvasViewDidFinishRendering: () {
                print('Canvas view finished rendering');
              },
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
              alwaysBounceVertical: true,
              alwaysBounceHorizontal: true,
              isRulerActive: true,
              drawingPolicy: PencilKitIos14DrawingPolicy.anyInput,
              isOpaque: true,
              backgroundColor: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.brush),
                onPressed: () {
                  drawController.currentToolType = ToolType.pen;
                },
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  drawController.show();
                },
              ),
              Obx(() => Slider(
                    value: drawController.currentWidth,
                    min: 1.0,
                    max: 10.0,
                    onChanged: (value) {
                      drawController.currentWidth = value;
                    },
                  )),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  drawController.currentColor = Colors.blue;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
