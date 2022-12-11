import 'package:bmi/controllers/bmi_controller.dart';
import 'package:bmi/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/components/bmi_container.dart';
import '../../shared/widgets/app_bar.dart';
import '../../shared/widgets/bmi_details.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BmiController controller = context.watch<BmiController>();
    return ChangeNotifierProvider.value(
      value: controller,
      child: ResponsiveLayout(
        mobileLayout: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyAppBar(
                  title: 'BMI Info',
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: BmiContainer(
                    width: .9,
                    height: .14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Your BMI',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          controller.result['result'],
                          style: TextStyle(fontSize: 45, fontFamily: 'Nimbus'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            controller.result['body'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF60cfda),
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ContainerDetails(),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                      controller.clearValues();
                    },
                    child: BmiContainer(
                      color: Color(0xFF60cfda),
                      width: .55,
                      height: .065,
                      child: Center(
                          child: Text(
                        'Try Again',
                        style: TextStyle(
                            fontFamily: 'Nimbus',
                            color: Colors.black,
                            fontSize: 17),
                      )),
                    ))
              ],
            ),
          ),
        ),
        desktopLayout: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
