import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  final RxBool isVisible;
  final RxDouble navBarWidth = 200.0.obs;

  Sidebar({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height - 100;

    return Obx(() => Row(
          children: [
            navBarWidth.value > 80
                ? Stack(
                    children: [
                      Container(
                        width: navBarWidth.value,
                        color: Colors.grey[200],
                        height: containerHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(Icons.folder),
                              title: Text('Folder 1'),
                            ),
                            ListTile(
                              leading: Icon(Icons.folder),
                              title: Text('Folder 2'),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              navBarWidth.value += details.delta.dx;
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.resizeLeftRight,
                              child: Container(
                                height: 50,
                                width: 20,
                                color: Colors.transparent,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            navBarWidth.value <= 80
                ? IconButton(
                    onPressed: () {
                      navBarWidth.value += 120;
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  )
                : Container(),
          ],
        ));
  }
}
