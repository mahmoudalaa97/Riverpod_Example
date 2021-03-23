import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonSocial extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final IconData fontAwesomeIcons;
  final VoidCallback onTap;

  const CustomButtonSocial(
      {Key key,
      this.backgroundColor = Colors.blue,
      this.title,
      this.fontAwesomeIcons=FontAwesomeIcons.question,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(fontAwesomeIcons),
            SizedBox(
              width: 10,
            ),
            Text(
              "$title",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
