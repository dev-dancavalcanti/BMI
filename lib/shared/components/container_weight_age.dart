import 'package:flutter/material.dart';

import 'bmi_container.dart';

class ContainerWeightAge extends StatelessWidget {
  const ContainerWeightAge(
      {Key? key,
      required this.title,
      this.onChanged,
      this.controller,
      this.ontapAdd,
      this.ontapRemove})
      : super(key: key);

  final String title;
  final TextEditingController? controller;
  final void Function()? ontapAdd;
  final void Function()? ontapRemove;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BmiContainer(
      height: MediaQuery.of(context).size.height * .00056,
      width: MediaQuery.of(context).size.width * .0013,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            TextFormField(
              onChanged: onChanged,
              controller: controller,
              style: TextStyle(
                  fontSize: 50, color: Color(0xFF5d6374), fontFamily: 'Nimbus'),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: InputBorder.none),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: ontapRemove,
                      child: BmiContainer(
                        border: 200,
                        wfixed: 30,
                        hfixed: 30,
                        width: .1,
                        height: .05,
                        child: Icon(Icons.remove),
                      ),
                    ),
                    GestureDetector(
                      onTap: ontapAdd,
                      child: BmiContainer(
                        border: 200,
                        wfixed: 30,
                        hfixed: 30,
                        width: .1,
                        height: .5,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
