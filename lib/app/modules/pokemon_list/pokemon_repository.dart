import 'package:pokeapi/core/models/pokemon.dart';
import 'package:pokeapi/core/network/api_routes.dart';
import 'package:pokeapi/core/network/router.dart';

class PokemonRepository {
  DioClient? _client;

  PokemonRepository({DioClient? client}) {
    this._client = client;
  }

  Future<List<Pokemon>> fetchPokemons(int gen) async {
    var response;
    switch (gen) {
      case 1:
        response = await _client?.dio
            .get(Routes.kPokemonListGenOne)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 2:
        response = await _client?.dio
            .get(Routes.kPokemonListGenTwo)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 3:
        response = await _client?.dio
            .get(Routes.kPokemonListGenThree)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 4:
        response = await _client?.dio
            .get(Routes.kPokemonListGenFour)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 5:
        response = await _client?.dio
            .get(Routes.kPokemonListGenFive)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 6:
        response = await _client?.dio
            .get(Routes.kPokemonListGenSix)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 7:
        response = await _client?.dio
            .get(Routes.kPokemonListGenSeven)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      case 8:
        response = await _client?.dio
            .get(Routes.kPokemonListGenEight)
            .catchError((dioError) {
          throw dioError;
        });
        break;
      default:
        response = await _client?.dio
            .get(Routes.kPokemonListGenOne)
            .catchError((dioError) {
          throw dioError;
        });
        break;
    }

    print(response?.statusCode);
    if (response?.statusCode == 200) {
      return (response?.data['results'] as List)
          .map((e) => Pokemon.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
