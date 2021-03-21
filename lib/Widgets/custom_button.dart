import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const Buttons({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          "$title",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        )),
      ),
    );
  }
}
