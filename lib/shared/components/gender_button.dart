import 'package:bmi/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bmi_container.dart';

class GenderButton extends StatefulWidget {
  const GenderButton(
      {Key? key,
      required this.title,
      required this.ontap,
      required this.colorButton,
      required this.colorText})
      : super(key: key);

  final String title;
  final void Function() ontap;
  final bool colorButton;
  final bool colorText;

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BmiController>();
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: widget.ontap,
          child: BmiContainer(
            color: widget.colorButton ? Color(0xFF60cfda) : Color(0xFFededed),
            height: 0.065,
            width: MediaQuery.of(context).size.width * .0012,
            child: Center(
                child: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Nimbus',
                  fontSize: 16,
                  color: widget.colorText ? Colors.white : Color(0xFFb8bcc8)),
            )),
          ),
        ),
      ),
    );
  }
}
