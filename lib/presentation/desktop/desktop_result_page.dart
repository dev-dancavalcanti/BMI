import 'package:bmi/shared/widgets/bmi_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../controllers/bmi_controller.dart';
import '../../shared/components/bmi_container.dart';
import '../../shared/widgets/app_bar.dart';

class ResultDesktop extends StatefulWidget {
  const ResultDesktop({super.key});

  @override
  State<ResultDesktop> createState() => ResultDesktopState();
}

class ResultDesktopState extends State<ResultDesktop> {
  @override
  Widget build(BuildContext context) {
    final BmiController controller = context.watch<BmiController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            MyAppBar(
              center: MainAxisAlignment.center,
              title: 'BMI Results',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Stack(
                children: [
                  Center(
                    child: BmiContainer(
                      hfixed: 400,
                      wfixed: 400,
                      height: .45,
                      width: .34,
                      border: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SleekCircularSlider(
                          initialValue: controller.result['progress'],
                          min: 0.0,
                          max: controller.result['progress'] > 40
                              ? controller.result['progress']
                              : 40,
                          appearance: CircularSliderAppearance(
                            infoProperties: InfoProperties(
                                modifier: (percentage) =>
                                    (percentage).toStringAsFixed(1).toString(),
                                mainLabelStyle: TextStyle(
                                    fontFamily: 'Nimbus', fontSize: 45)),
                            customColors: CustomSliderColors(
                                progressBarColor: Color(0xFF60cfda),
                                trackColor: Colors.grey.shade300),
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 15,
                                shadowWidth: 0,
                                handlerSize: 0,
                                trackWidth: 15),
                            angleRange: 358,
                            spinnerMode: false,
                            size: 200,
                            startAngle: 270,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 45),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  for (var text in controller.result['body'].split(' '))
                    TextSpan(
                      text: 'You have ${controller.result['body']} body weight',
                      style: TextStyle(
                          fontWeight: text.contains(controller.result['body'])
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: text.contains(controller.result['body'])
                              ? Color(0xFF60cfda)
                              : Color(0xFFb8bcc8),
                          fontSize: 16),
                    )
                ]),
              ),
            ),
            ContainerDetails(
              heigth: 500,
              width: 280,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                  controller.value = 1.2;
                  controller.weightController =
                      TextEditingController(text: '0');
                  controller.ageController = TextEditingController(text: '18');
                },
                child: Text('Voltar'))
            // SizedBox(
            //   width: 100,
            //   height: 300,
            // )
          ],
        ),
      ),
    );
  }
}
