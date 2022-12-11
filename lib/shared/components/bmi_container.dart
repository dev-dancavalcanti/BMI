import 'package:flutter/material.dart';

class BmiContainer extends StatelessWidget {
  const BmiContainer({
    Key? key,
    this.width,
    this.height,
    this.wfixed,
    this.hfixed,
    this.text,
    this.child,
    this.color,
    this.border,
  }) : super(key: key);

  final double? height;
  final double? wfixed;
  final double? hfixed;
  final double? width;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? border;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: wfixed ?? MediaQuery.of(context).size.width * width!,
        height: hfixed ?? MediaQuery.of(context).size.height * height!,
        decoration: BoxDecoration(
          color: color ?? Color(0xFFededed),
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFcad8e1),
                offset: Offset(5, 7),
                blurRadius: 5,
                blurStyle: BlurStyle.normal),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-5, -5),
                blurRadius: 4,
                blurStyle: BlurStyle.normal)
          ],
          borderRadius: BorderRadius.circular(border ?? 10),
        ),
        child: child);
  }
}
