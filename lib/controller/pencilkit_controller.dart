import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencil_kit/pencil_kit.dart';

class DrawController extends GetxController {
  late PencilKitController _controller;
  final _currentToolType = ToolType.pen.obs;
  final _currentWidth = 1.0.obs;
  final _currentColor = const Color.fromRGBO(0, 0, 0, 1).obs;
  final _base64Image = ''.obs;

  // Getters
  PencilKitController get controller => _controller;
  ToolType get currentToolType => _currentToolType.value;
  double get currentWidth => _currentWidth.value;
  Color get currentColor => _currentColor.value;
  String get base64Image => _base64Image.value;

  void show() {
    controller.show();
  }

  // Setters
  set controller(PencilKitController controller) {
    _controller = controller;
  }

  set currentToolType(ToolType toolType) {
    _currentToolType.value = toolType;
  }

  set currentWidth(double width) {
    _currentWidth.value = width;
  }

  set currentColor(Color color) {
    _currentColor.value = color;
  }

  set base64Image(String image) {
    _base64Image.value = image;
  }
}
