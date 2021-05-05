import 'package:flutter/material.dart';

class BudgetTile extends StatelessWidget {
  final Function onpressed;
  final Widget trailing;
  final String text;
  final String image;
  final int color;
  String subTitle;

  BudgetTile(
      {Key key,
      this.onpressed,
      this.trailing,
      this.color,
      this.image,
      this.subTitle = "",
      this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListTile(
          subtitle: Text(subTitle),
          onTap: onpressed,
          leading: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          title: Text(
            text,
            style: TextStyle(
                color: Color(0xff00192D),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          trailing: trailing),
    );
  }
}
