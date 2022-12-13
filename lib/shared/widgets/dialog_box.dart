import 'package:bmi/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final BmiController controller = context.watch<BmiController>();
    return AlertDialog(
      content: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Name',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digit your name',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                    text: 'Save',
                    onPressed: () async {
                      await controller.calculateBmi();
                      await controller.saveBMI();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/result');
                    }),
                MyButton(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.nameController.clear();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
