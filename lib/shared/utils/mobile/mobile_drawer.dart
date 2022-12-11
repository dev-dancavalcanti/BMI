import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../presentation/about_me_page.dart';
import '../../../presentation/home_page.dart';
import '../../../presentation/mobile/mobile_history_page.dart';
import '../../components/bmi_container.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      mainScreenTapClose: true,
      moveMenuScreen: true,
      style: DrawerStyle.defaultStyle,
      menuScreen: MobileDrawerBody(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      menuScreenWidth: 180,
      mainScreen: currentScreenMobile(),
      mainScreenScale: 0.1,
      borderRadius: 20,
      showShadow: false,
      angle: 0,
      slideWidth: 200,
      menuBackgroundColor: Color(0xFFededed),
    );
  }

  Widget currentScreenMobile() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return HistoryPage();
      case 2:
        return AboutMePage();
      default:
        return HomePage();
    }
  }
}

class MobileDrawerBody extends StatelessWidget {
  final ValueSetter setIndex;
  const MobileDrawerBody({super.key, required this.setIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      body: SingleChildScrollView(
        child: BmiContainer(
          wfixed: 200,
          hfixed: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerHeader(
                child: SvgPicture.asset(
                  'assets/icons/bmi.svg',
                  height: 80,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              drawerListMobile(
                  icon: 'assets/icons/home.svg', title: 'Home', index: 0),
              drawerListMobile(
                  icon: 'assets/icons/history.svg',
                  title: 'Historic',
                  index: 1),
              drawerListMobile(
                  icon: 'assets/icons/email.svg', title: 'Contact Me', index: 2)
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerListMobile(
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
