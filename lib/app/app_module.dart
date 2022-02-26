import 'package:flutter_modular/flutter_modular.dart';

import '../core/network/api_routes.dart';
import '../core/network/router.dart';
import 'modules/home_page/home_page_widget.dart';
import 'modules/pokemon_list/pokemon_controller.dart';
import 'modules/pokemon_list/pokemon_module.dart';
import 'modules/pokemon_list/pokemon_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DioClient.withLogs(baseUrl: Routes.kBase)),
    Bind((i) => PokemonRepository(client: i.get())),
    Bind((i) => PokemonController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/pokemon-list', module: PokemonModule()),
    ChildRoute('/', child: (_, args) => HomePageWidget())
  ];
}
