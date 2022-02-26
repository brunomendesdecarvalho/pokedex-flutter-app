import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/enums/request_state.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/models/pokemon.dart';

import 'pokemon_repository.dart';

class PokemonController extends Disposable {
  final statePokemon = RxNotifier<RequestState>(RequestState.IDLE);
  final pokemonList = RxList<Pokemon>([]);
  final PokemonRepository repository;

  PokemonController({required this.repository});

  void checkPokemons(int gen) {
    statePokemon.value = RequestState.LOADING;
    Functions.storeMethod(
        body: () async {
          var result = await repository.fetchPokemons(gen);
          if (pokemonList.isNotEmpty) {
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
    String name = this.pokemonList[index].name!.substring(0, 1).toUpperCase() +
        this.pokemonList[index].name!.substring(1).toLowerCase();
    return name;
  }

  String getPokemonNumberString(int index) {
    if (index < 9) {
      return '00' + (index + 1).toString();
    } else if (index >= 9 && index < 99) {
      return '0' + (index + 1).toString();
    } else {
      return (index + 1).toString();
    }
  }

  String getImageUrl(String pkmnNumber) {
    String baseUrl = 'https://www.serebii.net/pokemongo/pokemon/';
    return baseUrl + pkmnNumber + '.png';
  }

  int getPokemonNumber(int gen, int index) {
    switch (gen) {
      case 1:
        return index;

      case 2:
        return index + 151;

      case 3:
        return index + 251;

      case 4:
        return index + 386;

      case 5:
        return index + 493;

      case 6:
        return index + 649;

      case 7:
        return index + 721;

      case 8:
        return index + 809;
      default:
        return index;
    }
  }

  @override
  void dispose() {}
}
