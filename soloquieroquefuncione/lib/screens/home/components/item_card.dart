import 'package:flutter/material.dart';
import 'package:soloquieroquefuncione/models/Character.dart';

import 'package:soloquieroquefuncione/constants.dart';

class ItemCard extends StatelessWidget {
  final Character character;
  final VoidCallback press;

  const ItemCard({
    required this.character,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Card(
          elevation: 3,
          color: Color(0xFFF9E2B8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildHero(),
              buildNameInformation(),
              buildGenderInformation(),
            ],
          ),
        ));
  }

  Expanded buildHero() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(DefaultPadding),
        child: Hero(
            tag: "${character.id}",
            child: ClipRRect(
                borderRadius: BorderRadius.circular(BorderRadiusCard),
                child: Image.network(character.image))),
      ),
    );
  }

  Padding buildNameInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
      child: Text(
        character.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding buildGenderInformation() {
    return Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: DefaultPadding),
        child: Text(
          character.gender,
          style: TextStyle(color: TextLightColor),
        ));
  }
}
