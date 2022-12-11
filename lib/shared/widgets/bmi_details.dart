import 'package:flutter/material.dart';
import '../components/bmi_container.dart';

class ContainerDetails extends StatelessWidget {
  ContainerDetails({Key? key, this.heigth, this.width}) : super(key: key);

  double? heigth;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 60),
      child: BmiContainer(
        width: .9,
        wfixed: heigth,
        hfixed: width,
        height: .37,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Less than 18.5',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Underweight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nimbus')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('18.5 to 24.9'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Normal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nimbus')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('25 to 29.9'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Overweight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nimbus')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('30 to 34.9'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Obesity',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nimbus')),
                    )
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
