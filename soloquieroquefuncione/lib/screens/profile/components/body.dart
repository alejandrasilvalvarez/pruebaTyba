import 'package:flutter/material.dart';

import 'package:soloquieroquefuncione/models/Character.dart';
import 'package:soloquieroquefuncione/constants.dart';

class Body extends StatelessWidget {
  final Character character;

  const Body({required this.character});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        buildBackground(),
        buildProfileInformation(context),
      ],
    );
  }

  Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(4, 9, 35, 0.5),
            Color.fromRGBO(39, 105, 171, 0.6),
          ],
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
        ),
      ),
    );
  }

  Scaffold buildProfileInformation(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
          child: Column(
            children: [
              SizedBox(height: 20),
              buildCharacterName(),
              SizedBox(height: 22),
              Container(
                height: height * 0.43,
                child: buildLayoutCharacterInformation(),
              ),
              SizedBox(height: 30),
              Container(
                height: height * 0.5,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: buildFrameAppearances(height),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text buildCharacterName() {
    return Text(
      character.name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 34,
        fontFamily: 'Nisebuschgardens',
      ),
    );
  }

  LayoutBuilder buildLayoutCharacterInformation() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double innerWidth = constraints.maxWidth;
        return Stack(
          fit: StackFit.expand,
          children: [
            buildCharacterInformation(constraints),
            buildCharacterPhoto(innerWidth),
          ],
        );
      },
    );
  }

  Positioned buildCharacterInformation(constraints) {
    double innerHeight = constraints.maxHeight;
    double innerWidth = constraints.maxWidth;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: buildContainer(innerHeight, innerWidth),
    );
  }

  Container buildContainer(innerHeight, innerWidth) {
    return Container(
      height: innerHeight * 0.72,
      width: innerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildColumnOne(),
              buildPaddingContainer(),
              buildColumnTwo(),
            ],
          )
        ],
      ),
    );
  }

  Column buildColumnOne() {
    return Column(
      children: [
        Text(
          'Status',
          style: TextStyle(
            color: Colors.grey[700],
            fontFamily: 'Nunito',
            fontSize: 25,
          ),
        ),
        Text(
          character.status,
          style: TextStyle(
            color: Color.fromRGBO(39, 105, 171, 1),
            fontFamily: 'Nunito',
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  Padding buildPaddingContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 8,
      ),
      child: Container(
        height: 50,
        width: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey,
        ),
      ),
    );
  }

  Column buildColumnTwo() {
    return Column(
      children: [
        Text(
          'Specie',
          style: TextStyle(
            color: Colors.grey[700],
            fontFamily: 'Nunito',
            fontSize: 25,
          ),
        ),
        Text(
          character.species,
          style: TextStyle(
            color: Color.fromRGBO(39, 105, 171, 1),
            fontFamily: 'Nunito',
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  Positioned buildCharacterPhoto(innerWidth) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(BorderRadiusProfile),
            child: Image.network(
              character.image,
              width: innerWidth * 0.45,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildFrameAppearances(height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Appearances',
            style: TextStyle(
              color: Color.fromRGBO(39, 105, 171, 1),
              fontSize: 27,
              fontFamily: 'Nunito',
            ),
          ),
          Divider(thickness: 2.5),
          SizedBox(height: 10),
          Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
