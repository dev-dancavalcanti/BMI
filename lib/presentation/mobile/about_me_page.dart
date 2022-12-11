import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../../controllers/url_controller.dart';
import '../../shared/components/bmi_container.dart';
import '../../shared/widgets/app_bar.dart';

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UrlController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            MyAppBar(
                title: 'Contact Me',
                iconL: Icon(Icons.menu),
                onTapL: () => ZoomDrawer.of(context)!.toggle()),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BmiContainer(
                border: 200,
                wfixed: 250,
                hfixed: 250,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/teste.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Daniel Cavalcanti\nFlutter Developer',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.lauchHttps('github.com', '/dev-dancavalcanti');
                  },
                  child: BmiContainer(
                    width: .15,
                    height: .08,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/github.svg',
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.lauchEmail();
                  },
                  child: BmiContainer(
                    width: .15,
                    height: .08,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/email.svg'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.lauchHttps('instagram.com', '/danielwiins');
                  },
                  child: BmiContainer(
                    width: .15,
                    height: .08,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/instagram.svg'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.lauchHttps(
                        'linkedin.com', 'in/daniel-lucas-cavalcanti/');
                  },
                  child: BmiContainer(
                    width: .15,
                    height: .08,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/linkedin.svg'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
