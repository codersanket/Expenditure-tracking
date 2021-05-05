import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final TextEditingController expanses;

  const CustomeTextField({Key key, this.expanses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: expanses,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Color(0xff001A2E),
            fontSize: 50,
            fontWeight: FontWeight.bold),
        cursorColor: Color(0xff21CE99),
        decoration: InputDecoration(
            hintText: "0.0",
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
