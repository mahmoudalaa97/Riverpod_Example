import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchController =
    Provider<TextEditingController>((ref) => TextEditingController());
final searchClearController = StateProvider.autoDispose<bool>((ref) => false);

class CustomSearchWidget extends StatelessWidget {
  final ValueChanged<String> onFieldSubmitted;
  final String hint;

  const CustomSearchWidget({Key key, this.onFieldSubmitted, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.refresh(searchController);
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: context.read(searchController),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: hint, border: InputBorder.none),
              onChanged: (value) {
                if (value.isNotEmpty)
                  context.read(searchClearController).state = true;
                else
                  context.read(searchClearController).state = false;
              },
              onFieldSubmitted: onFieldSubmitted,
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              return Opacity(
                opacity: watch(searchClearController).state ? 1 : 0,
                child: IconButton(
                    icon: Icon(Icons.close_sharp),
                    onPressed: () {
                      context.read(searchController).clear();
                      context.read(searchClearController).state = false;
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
