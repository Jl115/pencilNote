import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pencilkit_note_taking/components/side_bar.dart';
import '../controller/counter_controller.dart';

class HomePage extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());
  var hasRootFolder = false.obs;
  var isSidebarVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Column(
          children: [
            const Text('Home Page', style: TextStyle(fontSize: 30)),
            Obx(() {
              return !hasRootFolder.value
                  ? IconButton(
                      icon: const Icon(Icons.folder),
                      onPressed: () {
                        // Handle folder tap
                        hasRootFolder.value = true; // Example action
                      },
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          children: [
                            // Sidebar
                            Sidebar(isVisible: isSidebarVisible),
                            // Main Content
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                height:
                                    MediaQuery.of(context).size.height - 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Text(
                                        'Count1: ${counterController.count1}',
                                        style: const TextStyle(fontSize: 20))),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await counterController
                                            .incrementCount1();
                                      },
                                      child: const Text('Add Folder'),
                                    ),
                                    const SizedBox(height: 20),
                                    Obx(() => Text(
                                        'Count2: ${counterController.count2}',
                                        style: const TextStyle(fontSize: 20))),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed:
                                          counterController.incrementCount2,
                                      child: const Text(
                                          'Navigate to Folder Detail Page'),
                                    ),
                                    const SizedBox(height: 20),
                                    Obx(() => Text(
                                        'Count3: ${counterController.count3}',
                                        style: const TextStyle(fontSize: 20))),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed:
                                          counterController.incrementCount3,
                                      child: const Text('Increment Count3'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
