import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:soloquieroquefuncione/models/Character.dart';

import 'package:soloquieroquefuncione/constants.dart';
import 'package:soloquieroquefuncione/screens/home/components/body.dart';
import 'package:soloquieroquefuncione/services/character.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: PrimaryAlphaColor,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            SearchIcon,
            color: TextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: DefaultHalfPadding)
      ],
    );
  }

  Center buildBody() {
    return Center(
        child: FutureBuilder<List<Character>>(
      future: getCharacters(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Body(characters: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return CircularProgressIndicator();
      },
    ));
  }
}
