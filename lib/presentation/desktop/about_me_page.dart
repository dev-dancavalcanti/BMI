import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../../controllers/url_controller.dart';
import '../../shared/components/bmi_container.dart';
import '../../shared/widgets/app_bar.dart';

class AboutMeDesktop extends StatelessWidget {
  const AboutMeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UrlController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              MyAppBar(
                  title: 'Contact Me',
                  iconL: Icon(Icons.menu),
                  onTapL: () => ZoomDrawer.of(context)!.toggle()),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: BmiContainer(
                  border: 200,
                  wfixed: 350,
                  hfixed: 350,
                  height: 0,
                  width: 0,
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.lauchHttps('github.com', '/dev-dancavalcanti');
                    },
                    child: Row(
                      children: [
                        BmiContainer(
                          wfixed: 100,
                          hfixed: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/icons/github.svg',
                            ),
                          ),
                        ),
                        Text(
                          '  dev-dancavalcanti',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.lauchEmail();
                    },
                    child: Row(
                      children: [
                        BmiContainer(
                          wfixed: 100,
                          hfixed: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('assets/icons/email.svg'),
                          ),
                        ),
                        Text(
                          ' dev.dancavalcanti@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.lauchHttps('instagram.com', '/danielwiins');
                      },
                      child: Row(
                        children: [
                          BmiContainer(
                            wfixed: 100,
                            hfixed: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/icons/instagram.svg'),
                            ),
                          ),
                          Text(
                            '  @danielwiins        ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.lauchHttps(
                            'linkedin.com', 'in/daniel-lucas-cavalcanti/');
                      },
                      child: Row(
                        children: [
                          BmiContainer(
                            wfixed: 100,
                            hfixed: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  SvgPicture.asset('assets/icons/linkedin.svg'),
                            ),
                          ),
                          Text(
                            '  Daniel Lucas Cavalcanti           ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
