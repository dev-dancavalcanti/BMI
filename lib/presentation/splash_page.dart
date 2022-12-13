import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation alignAnimation;
  late Animation sizeAnimation;
  late Animation moreSizeAnimation;
  late Animation opacityTextAnimation;
  late Animation opacityWeightAnimation;
  late Animation opacityHeightAnimation;
  late Animation opacityAgeAnimation;
  late Animation reverseAgeAnimation;
  late Animation reverseHeightAnimation;
  late Animation reverseWeightAnimation;
  late Animation radiusAnimation;

  @override
  void initState() {
    const duration = Duration(seconds: 5);
    controller = AnimationController(vsync: this, duration: duration);
    alignAnimation =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.center)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0, .2, curve: Curves.bounceOut)));
    sizeAnimation = Tween<double>(begin: 0, end: 70)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, .2)));
    opacityWeightAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.2, .35)));
    reverseWeightAnimation = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.3, .35)));
    opacityHeightAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Interval(.35, .50)));
    reverseHeightAnimation = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.45, .5)));
    opacityAgeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.5, .65)));
    reverseAgeAnimation = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.6, .65)));
    opacityTextAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(.65, .8, curve: Curves.bounceOut)));
    moreSizeAnimation = Tween<double>(begin: 70, end: 2000)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.7, 1)));
    radiusAnimation = Tween<double>(begin: 100, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(.7, 1)));

    super.initState();

    controller.forward();

    controller.addListener(() {
      setState(() {
        if (controller.isCompleted && mounted) {
          Navigator.of(context).pushReplacementNamed('/drawer');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        });
      },
      child: Scaffold(
          backgroundColor: Color(0xFF60cfda),
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                  alignment: alignAnimation.value,
                  child: Container(
                    width: moreSizeAnimation.value,
                    height: moreSizeAnimation.value,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(radiusAnimation.value),
                      color: Color(0xFFededed),
                    ),
                    child: Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFFededed),
                      ),
                      child: Center(
                          child: Opacity(
                              opacity: opacityTextAnimation.value,
                              child: Text(
                                'BMI',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  )),
              Opacity(
                opacity: reverseWeightAnimation.value,
                child: Opacity(
                    opacity: opacityWeightAnimation.value,
                    child:
                        SvgPicture.asset('assets/icons/weight.svg', width: 40)),
              ),
              Opacity(
                opacity: reverseHeightAnimation.value,
                child: Opacity(
                    opacity: opacityHeightAnimation.value,
                    child:
                        SvgPicture.asset('assets/icons/height.svg', width: 40)),
              ),
              Opacity(
                opacity: reverseAgeAnimation.value,
                child: Opacity(
                    opacity: opacityAgeAnimation.value,
                    child: SvgPicture.asset('assets/icons/age.svg', width: 40)),
              ),
            ],
          )),
    );
  }
}
