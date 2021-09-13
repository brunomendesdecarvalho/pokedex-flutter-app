import 'package:pokeapi/core/models/pokemon.dart';
import 'package:pokeapi/core/network/api_routes.dart';
import 'package:pokeapi/core/network/router.dart';

class PokemonRepository {
  DioClient? _client;

  PokemonRepository({DioClient? client}) {
    this._client = client;
  }

  Future<List<Pokemon>> fetchPokemons() async {
    final response =
    await _client?.dio.get(Routes.kPokemonList).catchError((dioError) {
      throw dioError;
    });
    print(response?.statusCode);
    if (response?.statusCode == 200) {
      return (response?.data['results'] as List).map((e) => Pokemon.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
