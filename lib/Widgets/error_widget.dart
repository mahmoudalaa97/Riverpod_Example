import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final  error;

  const CustomErrorWidget({Key key, this.error}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$error"),
    );
  }
}
