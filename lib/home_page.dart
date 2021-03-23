import 'package:flutter/material.dart';
import 'package:state_managment/View/github_search_page.dart';
import 'package:state_managment/Widgets/custom_button.dart';

import 'View/LoginWithSocial/login_with_social_page.dart';
import 'View/counter_page.dart';
import 'View/news_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Context");

    return Scaffold(
      appBar: AppBar(
        title: Text("Mahmoud Riverpod"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.8,
          mainAxisSpacing: 5,
        ),
        shrinkWrap: true,
        children: <Widget>[
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
          ),
          Buttons(
            title: "Github Search Page",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GithubSearchPage(),
                  ));
            },
          ),
          Buttons(
            title: "Login With Social Page",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginWithSocialPage(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
