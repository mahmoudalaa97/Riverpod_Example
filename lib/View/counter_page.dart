import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/Widgets/custom_button.dart';

final counter = StateProvider<int>((ref) => 0);

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.read(counter);
    return Scaffold(
      appBar: AppBar(title: Text(" Counter"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Consumer(
              builder: (context, watch, child) =>
                  Text("Counter ${watch(counter).state}"),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                    title: "+",
                    onTap: () {
                      provider.state++;
                    }),
                Buttons(
                    title: "-",
                    onTap: () {
                      provider.state--;
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
