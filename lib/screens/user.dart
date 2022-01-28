import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/user_text.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23),
      child: Column(children: const [
        CircleAvatar(
          child: Icon(
            Icons.person,
            size: 100,
          ),
          radius: 70,
        ),
        SizedBox(
          height: 20,
        ),
        UserText(
          icon: Icons.account_circle,
          text: "Aftab Bagwan",
        ),
        UserText(
          icon: FontAwesomeIcons.birthdayCake,
          text: "13/07/2001",
        ),
        UserText(
          icon: FontAwesomeIcons.mobile,
          text: "9623865786",
        ),
        UserText(
          icon: FontAwesomeIcons.instagram,
          text: "aftabbagwan@insta",
        ),
        UserText(
          icon: Icons.mail,
          text: "aftabbagwan9886@gmail.com",
        ),
        UserText(
          icon: Icons.password,
          text: "********",
        ),
      ]),
    );
  }
}
