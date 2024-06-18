import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pencil_kit/pencil_kit.dart';

class DrawModel extends ChangeNotifier {
  late PencilKitController _controller;
  ToolType _currentToolType = ToolType.pen;
  double _currentWidth = 1;
  Color _currentColor = const Color.fromRGBO(0, 0, 0, 1);
  String _base64Image = '';

  // Getters
  PencilKitController get controller => _controller;
  ToolType get currentToolType => _currentToolType;
  double get currentWidth => _currentWidth;
  Color get currentColor => _currentColor;
  String get base64Image => _base64Image;

  // Setters
  set controller(PencilKitController controller) {
    _controller = controller;
    print('controller set');
    notifyListeners();
  }

  set currentToolType(ToolType toolType) {
    _currentToolType = toolType;
    print('currentToolType set');
    notifyListeners();
  }

  set currentWidth(double width) {
    print('currentWidth set');
    _currentWidth = width;
    notifyListeners();
  }

  set currentColor(Color color) {
    print('currentColor set');
    _currentColor = color;
    notifyListeners();
  }

  set base64Image(String image) {
    print('base64Image set');
    _base64Image = image;
    notifyListeners();
  }
}

final drawModelProvider = ChangeNotifierProvider<DrawModel>((ref) {
  print('drawModelProvider');
  return DrawModel();
});
