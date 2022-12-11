import 'package:bmi/shared/components/bmi_container.dart';
import 'package:bmi/shared/components/container_weight_age.dart';
import 'package:bmi/shared/components/gender_button.dart';
import 'package:bmi/shared/widgets/app_bar.dart';
import 'package:bmi/shared/widgets/dialog_box.dart';
import 'package:bmi/shared/widgets/slider_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../../controllers/bmi_controller.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  double value = 1.2;

  @override
  Widget build(BuildContext context) {
    final BmiController controller = context.watch<BmiController>();
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: controller,
        child: SingleChildScrollView(
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
                              controller.genderSelect = Gender.male;
                              controller.selectGender = true;
                            }),
                        colorButton: controller.genderSelect == Gender.male,
                        colorText: controller.genderSelect == Gender.male),
                    SizedBox(
                      width: 20,
                    ),
                    GenderButton(
                        title: 'Female',
                        ontap: () => setState(() {
                              controller.genderSelect = Gender.female;
                              controller.selectGender = false;
                            }),
                        colorButton: controller.genderSelect == Gender.female,
                        colorText: controller.genderSelect == Gender.female)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SliderVertical(
                            onChanged: (newValue) => setState(() {
                                  controller.value = newValue;
                                  controller.setAltura(controller.value);
                                }),
                            value: controller.value),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
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
                              height: 10,
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    if (controller.genderSelect != null) {
                      await showDialog(
                          context: context, builder: (context) => DialogBox());
                    }
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
                // SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
