import 'package:flutter/material.dart';
import '../components/bmi_container.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {Key? key,
      required this.title,
      this.onTapL,
      this.iconL,
      this.onTapR,
      this.iconR,
      this.isVisible = true,
      this.center})
      : super(key: key);

  final String title;
  final void Function()? onTapL;
  final Icon? iconL;
  final void Function()? onTapR;
  final Icon? iconR;
  final bool isVisible;
  final MainAxisAlignment? center;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTapL ?? () => Navigator.of(context).pop(),
              child: BmiContainer(
                  border: 40,
                  wfixed: 40,
                  hfixed: 40,
                  child: iconL ??
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF51565A),
                      )),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Nimbus',
                fontSize: 25,
                color: Color(0xFF51565A),
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}
