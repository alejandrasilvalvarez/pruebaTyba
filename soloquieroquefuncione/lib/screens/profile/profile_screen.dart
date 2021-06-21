import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soloquieroquefuncione/constants.dart';
import 'package:soloquieroquefuncione/models/Character.dart';
import 'package:soloquieroquefuncione/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  final Character character;

  const ProfileScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(character: character),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: PrimaryAlphaColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[SizedBox(width: DefaultPadding / 2)],
    );
  }
}
