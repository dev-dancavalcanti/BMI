import 'package:bmi/shared/responsive/responsive_layout.dart';
import 'package:bmi/shared/utils/desktop/desktop_drawer.dart';
import 'package:bmi/shared/utils/mobile/mobile_drawer.dart';
import 'package:flutter/material.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        desktopLayout: DesktopDrawer(), mobileLayout: MobileDrawer());
  }
}
