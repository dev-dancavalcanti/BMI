import 'package:bmi/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'desktop/about_me_page.dart';
import 'mobile/about_me_page.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopLayout: AboutMeDesktop(),
      mobileLayout: AboutMeMobile(),
    );
  }
}
