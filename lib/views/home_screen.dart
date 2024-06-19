import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';

class HomePage extends StatelessWidget {
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX MVP Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Count1: ${counterController.count1}',
                style: TextStyle(fontSize: 20))),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: counterController.incrementCount1,
              child: Text('Increment Count1'),
            ),
            SizedBox(height: 20),
            Obx(() => Text('Count2: ${counterController.count2}',
                style: TextStyle(fontSize: 20))),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: counterController.incrementCount2,
              child: Text('Increment Count2'),
            ),
            SizedBox(height: 20),
            Obx(() => Text('Count3: ${counterController.count3}',
                style: TextStyle(fontSize: 20))),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: counterController.incrementCount3,
              child: Text('Increment Count3'),
            ),
          ],
        ),
      ),
    );
  }
}
