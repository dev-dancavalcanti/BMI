import 'package:bmi/controllers/bmi_controller.dart';
import 'package:bmi/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/card_history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    BmiController controller = context.watch<BmiController>();
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: controller,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyAppBar(
                  title: 'BMI History',
                  iconL: Icon(Icons.menu),
                  onTapL: () => ZoomDrawer.of(context)!.toggle()),
            ),
            controller.isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: controller.listBMI.person.length,
                          itemBuilder: (context, index) {
                            return CardHistory(
                              name: controller.listBMI.person[index].name,
                              idade: controller.listBMI.person[index].idade
                                  .toString(),
                              deletedHistory: () {
                                controller.deletedHistory(index);
                              },
                              color: controller.listBMI.person[index].genero!,
                              altura: controller.listBMI.person[index].altura
                                  .toString(),
                              peso: controller.listBMI.person[index].peso
                                  .toString(),
                              bmi: controller.listBMI.person[index].bmi
                                  .toString(),
                              body: controller.listBMI.person[index].body
                                  .toString(),
                            );
                          }),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
