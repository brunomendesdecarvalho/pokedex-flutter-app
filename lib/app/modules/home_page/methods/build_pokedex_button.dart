import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

Widget buildPokedexButton(int gen, String text) {
  return ElevatedButton(
      onPressed: () =>
          Modular.to.pushNamed('/pokemon-list', arguments: gen),
      child: Text(text));
}