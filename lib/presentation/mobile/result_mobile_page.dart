import 'package:bmi/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../shared/components/bmi_container.dart';
import '../../shared/widgets/app_bar.dart';

class ResultMobile extends StatefulWidget {
  const ResultMobile({
    super.key,
  });

  @override
  State<ResultMobile> createState() => _ResultMobileState();
}

class _ResultMobileState extends State<ResultMobile> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BmiController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              MyAppBar(title: 'BMI Results'),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Stack(
                  children: [
                    Center(
                      child: BmiContainer(
                        hfixed: 250,
                        wfixed: 250,
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
                                  modifier: (percentage) => (percentage)
                                      .toStringAsFixed(1)
                                      .toString(),
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
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    for (var text in controller.result['body'].split(' '))
                      TextSpan(
                        text:
                            'You have ${controller.result['body']} body weight',
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
              GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                        '/details',
                        arguments: controller.result,
                      ),
                  child: BmiContainer(
                    width: .4,
                    height: .06,
                    child: Center(
                        child: Text(
                      'Details',
                      style: Theme.of(context).textTheme.headline2,
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
