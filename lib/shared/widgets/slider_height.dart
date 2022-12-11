import 'package:bmi/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../components/bmi_container.dart';

class SliderVertical extends StatelessWidget {
  const SliderVertical({Key? key, required this.onChanged, required this.value})
      : super(key: key);

  final void Function(dynamic)? onChanged;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SfTheme(
      data: SfThemeData(
        sliderThemeData: SfSliderThemeData(
            overlayColor: Colors.transparent,
            thumbColor: Colors.white,
            activeTrackColor: Color(0xFF60cfda),
            inactiveTrackColor: Colors.white),
      ),
      child: ResponsiveLayout(
        desktopLayout: BmiContainer(
            height: .15,
            width: 1,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Height',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: SfSlider(
                  value: value,
                  onChanged: onChanged,
                  showTicks: false,
                  interval: .05,
                  stepSize: .05,
                  showDividers: false,
                  showLabels: true,
                  min: 1.2,
                  max: 2.2,
                ),
              )
            ])),
        mobileLayout: BmiContainer(
            height: .7,
            width: 0.4,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Height',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                child: SfSlider.vertical(
                  value: value,
                  onChanged: onChanged,
                  showTicks: false,
                  interval: .05,
                  stepSize: .05,
                  showDividers: false,
                  showLabels: true,
                  min: 1.2,
                  max: 2.2,
                ),
              )
            ])),
      ),
    );
  }
}
