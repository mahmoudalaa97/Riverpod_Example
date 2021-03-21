import 'package:flutter/material.dart';
import 'package:riverpod1/Widgets/custom_button.dart';

import 'counter_page.dart';
import 'news_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Context");

    return Scaffold(
      appBar: AppBar(
        title: Text("Mahmoud Riverpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Buttons(
              title: "Counter Page",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounterPage(),
                    ));
              },
            ),
            Buttons(
              title: "News Page",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsPage(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
