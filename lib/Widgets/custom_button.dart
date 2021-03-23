import 'package:flutter/material.dart';

import '../utils/extentions.dart';

class Buttons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final double width;

  const Buttons({Key key, this.title, this.onTap, this.height=45, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.gridViewButtonColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text("$title",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }
}
