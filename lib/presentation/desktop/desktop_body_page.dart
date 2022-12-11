import 'package:bmi/shared/components/bmi_container.dart';
import 'package:bmi/shared/components/container_weight_age.dart';
import 'package:bmi/shared/components/gender_button.dart';
import 'package:bmi/presentation/result_page.dart';
import 'package:bmi/shared/widgets/app_bar.dart';
import 'package:bmi/shared/widgets/slider_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../../controllers/bmi_controller.dart';

enum Gender { male, female }

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  Gender? genderSelect;

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final BmiController controller = context.watch<BmiController>();
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: controller,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MyAppBar(
                  title: 'BMI Calculator',
                  iconL: Icon(Icons.menu),
                  onTapL: () => ZoomDrawer.of(context)!.toggle(),
                ),
                Row(
                  children: [
                    GenderButton(
                        title: 'Male',
                        ontap: () => setState(() {
                              genderSelect = Gender.male;
                            }),
                        colorButton: genderSelect == Gender.male,
                        colorText: genderSelect == Gender.male),
                    SizedBox(
                      width: 20,
                    ),
                    GenderButton(
                        title: 'Female',
                        ontap: () => setState(() {
                              genderSelect = Gender.female;
                            }),
                        colorButton: genderSelect == Gender.female,
                        colorText: genderSelect == Gender.female)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ContainerWeightAge(
                        title: 'Weight',
                        onChanged: controller.setPeso,
                        controller: controller.weightController,
                        ontapAdd: controller.incrementedValue,
                        ontapRemove: controller.decrementedValue,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: ContainerWeightAge(
                        title: 'Age',
                        controller: controller.ageController,
                        ontapAdd: controller.incrementedAgeValue,
                        ontapRemove: controller.decrementedAgeValue,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SliderVertical(
                          onChanged: (newValue) => setState(() {
                                controller.value = newValue;
                                controller.setAltura(controller.value);
                              }),
                          value: controller.value),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller.calculateBmi();
                    Navigator.of(context).pushNamed('/result');
                  },
                  child: const BmiContainer(
                    color: Color(0xFF60cfda),
                    height: .06,
                    width: 1,
                    child: Center(
                        child: Text(
                      'Let\'s Begin',
                      style: TextStyle(
                          fontFamily: 'Nimbus',
                          fontSize: 16,
                          color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
