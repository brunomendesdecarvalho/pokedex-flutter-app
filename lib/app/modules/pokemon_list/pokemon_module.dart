import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/network/api_routes.dart';
import '../../../core/network/router.dart';

import 'pokemon_controller.dart';
import 'pokemon_repository.dart';
import 'pokemon_widget.dart';

class PokemonModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DioClient.withLogs(baseUrl: Routes.kBase)),
    Bind((i) => PokemonRepository(client: i.get())),
    Bind((i) => PokemonController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => PokemonWidget())
  ];
}
