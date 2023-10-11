import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  var textStyle = TextStyle(fontSize: 25);

  return RichText(
    text: TextSpan(
      style: textStyle,
      children: const <TextSpan>[
        TextSpan(
            text: 'Quiz',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            )),
        TextSpan(
            text: 'Maker',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            )),
      ],
    ),
  );
}

Widget blueButton(
  BuildContext context,
  String label,
) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
    height: 50,
    width: MediaQuery.of(context).size.width,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}
