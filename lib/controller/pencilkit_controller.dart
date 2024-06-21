import 'dart:io';

import 'package:get/get.dart';
import 'package:pencil_kit/pencil_kit.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PencilKitControler extends GetxController {
  late final PencilKitController controller;
  ToolType currentToolType = ToolType.pen;
  double currentWidth = 1.0;
  Color currentColor = Colors.black;
  String base64Image = '';

  void showToolPicker() {
    controller.show();
  }

  void hideToolPicker() {
    controller.hide();
  }

  void undo() {
    controller.undo();
  }

  void redo() {
    controller.redo();
  }

  void clear() {
    controller.clear();
  }

  void setTool(ToolType toolType, double width, Color color) {
    currentToolType = toolType;
    currentWidth = width;
    currentColor = color;
    controller.setPKTool(toolType: toolType, width: width, color: color);
  }

  Future<String> getBase64Data() async {
    return await controller.getBase64Data();
  }

  Future<String> getBase64PngData() async {
    return await controller.getBase64PngData();
  }

  Future<String> getBase64JpegData() async {
    return await controller.getBase64JpegData();
  }

  Future<void> saveDrawing() async {
    final Directory documentDir = await getApplicationDocumentsDirectory();
    final String pathToSave = '${documentDir.path}/drawing';
    await controller.save(uri: pathToSave, withBase64Data: true);
  }

  Future<void> loadDrawing() async {
    final Directory documentDir = await getApplicationDocumentsDirectory();
    final String pathToLoad = '${documentDir.path}/drawing';
    await controller.load(uri: pathToLoad, withBase64Data: true);
  }

  // void loadBase64Drawing(String base64Data) {
  //   controller.loadBase64PngData(base64Data);
  // }
}
