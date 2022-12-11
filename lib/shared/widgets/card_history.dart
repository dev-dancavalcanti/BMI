import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardHistory extends StatefulWidget {
  const CardHistory(
      {Key? key,
      required this.bmi,
      required this.body,
      required this.deletedHistory,
      required this.color,
      required this.altura,
      required this.peso,
      required this.name,
      required this.idade})
      : super(key: key);

  final String bmi;
  final String body;
  final Function()? deletedHistory;
  final bool color;
  final String name;
  final String altura;
  final String peso;
  final String idade;

  @override
  State<CardHistory> createState() => _CardHistoryState();
}

class _CardHistoryState extends State<CardHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: widget.color
                  ? Color.fromARGB(255, 122, 161, 228)
                  : Color.fromARGB(255, 234, 150, 216),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFFcad8e1),
                    offset: Offset(-2, 7),
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -2),
                    blurRadius: 4,
                    blurStyle: BlurStyle.normal)
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text('Your BMI is ${widget.bmi}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text('Your body is ${widget.body}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/height.svg',
                        width: 30,
                        height: 25,
                      ),
                      Text(': ${widget.altura} '),
                      SvgPicture.asset(
                        'assets/icons/weight.svg',
                        width: 30,
                        height: 25,
                      ),
                      Text(' : ${widget.peso} '),
                      SvgPicture.asset(
                        'assets/icons/age.svg',
                        width: 30,
                        height: 25,
                      ),
                      Text(' : ${widget.idade}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                      onTap: widget.deletedHistory,
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.delete, size: 20),
                              Text('Delet History')
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            )));
  }
}
