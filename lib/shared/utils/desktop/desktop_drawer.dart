import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../presentation/about_me_page.dart';
import '../../../presentation/home_page.dart';
import '../../components/bmi_container.dart';

class DesktopDrawer extends StatefulWidget {
  const DesktopDrawer({super.key});

  @override
  State<DesktopDrawer> createState() => _DesktopDrawerState();
}

class _DesktopDrawerState extends State<DesktopDrawer> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreenTapClose: true,
      moveMenuScreen: false,
      style: DrawerStyle.style1,
      menuScreen: DesktopDrawerBody(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      menuScreenWidth: 180,
      mainScreen: currentScreenDesktop(),
      mainScreenScale: 0.1,
      borderRadius: 0,
      showShadow: false,
      angle: 0,
      slideWidth: 200,
      menuBackgroundColor: Colors.transparent,
    );
  }

  Widget currentScreenDesktop() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return AboutMePage();
      default:
        return HomePage();
    }
  }
}

class DesktopDrawerBody extends StatelessWidget {
  final ValueSetter setIndex;
  const DesktopDrawerBody({super.key, required this.setIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      body: BmiContainer(
        wfixed: 200,
        hfixed: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20),
                  child: GestureDetector(
                    onTap: () => ZoomDrawer.of(context)!.toggle(),
                    child: BmiContainer(
                        border: 40,
                        wfixed: 40,
                        hfixed: 40,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        )),
                  ),
                ),
              ],
            ),
            DrawerHeader(
              child: SvgPicture.asset(
                'assets/icons/bmi.svg',
                height: 100,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            drawerListDesktop(
                icon: 'assets/icons/home.svg', title: 'Home', index: 0),
            drawerListDesktop(
                icon: 'assets/icons/email.svg', title: 'Contact Me', index: 1)
          ],
        ),
      ),
    );
  }

  Widget drawerListDesktop(
      {required String icon, required String title, required int index}) {
    return GestureDetector(
      onTap: () {
        setIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 10,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
