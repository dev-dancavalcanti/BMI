import 'package:bmi/controllers/bmi_controller.dart';
import 'package:bmi/presentation/mobile/result_mobile_page.dart';
import 'package:bmi/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'desktop/desktop_result_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BmiController>();

    return ChangeNotifierProvider.value(
      value: controller,
      child: ResponsiveLayout(
        desktopLayout: ResultDesktop(),
        mobileLayout: ResultMobile(),
      ),
    );
  }
}
