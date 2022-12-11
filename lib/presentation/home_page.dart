import 'package:bmi/presentation/mobile/mobile_body_page.dart';
import 'package:bmi/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'desktop/desktop_body_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: MobileBody(),
      desktopLayout: DesktopBody(),
    );
  }
}
