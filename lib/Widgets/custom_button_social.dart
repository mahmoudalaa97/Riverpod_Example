import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:state_managment/Services/Repositories/social_repository.dart';
final _repository= StateProvider<SocialRepository>((ref)=>null);
class CustomButtonSocial extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final IconData fontAwesomeIcons;
  final SocialRepository socialRepository;

  const CustomButtonSocial(
      {Key key,
      this.backgroundColor = Colors.blue,
      this.title,
      this.fontAwesomeIcons=FontAwesomeIcons.question, @required this.socialRepository,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read(_repository).state=socialRepository;
        context.read(_repository).state.login();
      },
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
