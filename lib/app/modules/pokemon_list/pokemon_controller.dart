import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapi/app/modules/pokemon_list/pokemon_repository.dart';
import 'package:pokeapi/core/enums/request_state.dart';
import 'package:pokeapi/core/helpers/functions.dart';
import 'package:pokeapi/core/models/pokemon.dart';
import 'package:rx_notifier/rx_notifier.dart';

class PokemonController extends Disposable{
  final statePokemon = RxNotifier<RequestState>(RequestState.IDLE);
  final pokemonList = RxList<Pokemon>([]);
  final PokemonRepository repository;

  PokemonController({required this.repository});

  void checkPokemons() {
    statePokemon.value = RequestState.LOADING;
    Functions.storeMethod(
        body: () async {
          var result = await repository.fetchPokemons();
          if(pokemonList.isNotEmpty) {
            pokemonList.clear();
          }
          pokemonList.addAll(result);
          statePokemon.value = RequestState.SUCCESS;
          print(statePokemon.value);
        },
        onError: () => statePokemon.value = RequestState.FAIL,
        resultState: (value) => statePokemon.value = value);
  }

  String getName(int index) {
    return this.pokemonList[index].name!.substring(0,1).toUpperCase() + this.pokemonList[index].name!.substring(1).toLowerCase();
  }

  String getPokemonNumber(int index) {
    if(index < 9) {
      return '00' + (index + 1).toString();
    }
    else if(index >= 9 && index < 99) {
      return '0' + (index + 1).toString();
    }
    else {
      return (index + 1).toString();
    }
  }

  String getImageUrl(String pkmnNumber) {
    String baseUrl = 'https://www.serebii.net/pokemongo/pokemon/';
    return baseUrl + pkmnNumber + '.png';
  }

  @override
  void dispose() {}
}