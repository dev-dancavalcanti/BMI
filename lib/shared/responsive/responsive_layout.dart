import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopLayout;
  final Widget mobileLayout;

  const ResponsiveLayout({
    super.key,
    required this.desktopLayout,
    required this.mobileLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth <= 1007) {
        return mobileLayout;
      } else {
        return desktopLayout;
      }
    });
  }
}
