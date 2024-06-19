import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pencil_kit/pencil_kit.dart';

class NoteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          child: Text('Open PencilKit'),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                actions: [
                  // PencilKitView(
                  //   onPencilKitViewCreated: (controller) {
                  //     // Handle PencilKitView creation
                  //   },
                  // ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
