import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Widgets/custom_button.dart';

final counterController= StateNotifierProvider<CounterController>((ref)=>CounterController());

class CounterController extends StateNotifier<int>{
  CounterController() : super(0);

  void add(){
    state=state + 1;
  }

  void subtract(){
    // handle the counter not be negative
    if(state!=0)
    state=state - 1;
  }

}
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Text("Counter ${watch(counterController.state)}"),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  height: 50,
                    width: 50,
                    title: "+",
                    onTap: () {
                     context.read(counterController).add();
                    }),
                Buttons(
                  height: 50,
                    width: 50,
                    title: "-",
                    onTap: () {
                      context.read(counterController).subtract();

                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
