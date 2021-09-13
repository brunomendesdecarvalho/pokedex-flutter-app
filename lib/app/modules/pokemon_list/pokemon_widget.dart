import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapi/app/modules/pokemon_list/pokemon_controller.dart';
import 'package:pokeapi/core/widgets/loader_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

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
    controller.checkPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // canPop: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RxBuilder(builder: (_) {
            return ListView.builder(
                // scrollDirection: Axis.vertical,
                itemCount: controller.pokemonList.length,
                itemBuilder: (context, index) {
                  if (controller.pokemonList.isNotEmpty) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Row(children: [
                            Image.network(controller.getImageUrl(controller.getPokemonNumber(index)), width: 100, height: 100,),
                            Spacer(),
                            Container(
                              height: 24,
                              child: Text(
                                '#${controller.getPokemonNumber(index)} - ${controller.getName(index)}',
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ]),
                        ),
                        SizedBox(width: 16)
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
