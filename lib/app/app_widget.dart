import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.blueAccent),
          debugShowCheckedModeBanner: false,
          title: 'Pokedex',
          // supportedLocales: [Locale('pt', 'BR')],
        ).modular());
  }
}
