import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapi/app/modules/home_page/methods/build_pokedex_button.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildPokedexButton(1, '1st Gen Pokedex'),
            buildPokedexButton(2, '2nd Gen Pokedex'),
            buildPokedexButton(3, '3rd Gen Pokedex'),
            buildPokedexButton(4, '4th Gen Pokedex'),
            buildPokedexButton(5, '5th Gen Pokedex'),
            buildPokedexButton(6, '6th Gen Pokedex'),
            buildPokedexButton(7, '7th Gen Pokedex'),
            buildPokedexButton(8, '8th Gen Pokedex'),
          ],
        ),
      ),
    );
  }
}
