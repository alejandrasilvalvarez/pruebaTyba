import 'package:flutter/material.dart';
import 'package:soloquieroquefuncione/constants.dart';
import 'package:soloquieroquefuncione/models/Character.dart';
import 'package:soloquieroquefuncione/screens/profile/profile_screen.dart';

import 'item_card.dart';

class Body extends StatelessWidget {
  final List<Character> characters;

  Body({required this.characters});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildTitle(context, size),
        SizedBox(height: 30),
        buildCharactersCards(),
      ],
    );
  }

  Container buildTitle(context, Size size) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(BorderRadiusTitle),
                    bottomRight: Radius.circular(BorderRadiusTitle))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: DefaultPadding, right: DefaultPadding, top: 30),
              child: Text(
                "Rick & Morty app - Tyba",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded buildCharactersCards() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
        child: GridView.builder(
            itemCount: characters.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: DefaultPadding,
              crossAxisSpacing: DefaultPadding,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard(
                  character: characters[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          character: characters[index],
                        ),
                      )),
                )),
      ),
    );
  }
}
