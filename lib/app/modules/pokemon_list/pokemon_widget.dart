import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/widgets/loader_widget.dart';

import 'pokemon_controller.dart';

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({Key? key}) : super(key: key);

  @override
  _PokemonWidgetState createState() => _PokemonWidgetState();
}

class _PokemonWidgetState
    extends ModularState<PokemonWidget, PokemonController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var gen = ModalRoute.of(context)!.settings.arguments as int;
    controller.checkPokemons(gen);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: width * .01, right: width * .015),
          child: RxBuilder(builder: (_) {
            return ListView.builder(
                itemCount: controller.pokemonList.length,
                itemBuilder: (context, index) {
                  if (controller.pokemonList.isNotEmpty) {
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Row(children: [
                            Image.network(
                                controller.getImageUrl(
                                    controller.getPokemonNumberString(controller
                                        .getPokemonNumber(gen, index))),
                                width: width * .25),
                            Spacer(),
                            Container(
                              width: width * .6,
                              child: Text(
                                '#${controller.getPokemonNumberString(controller.getPokemonNumber(gen, index))} - ${controller.getName(index)}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ]),
                        ),
                      ],
                    );
                  } else {
                    return LoaderWidget(key: Key('pokemonList'));
                  }
                });
          }),
        ),
      ),
    );
  }
}
