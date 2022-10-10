import 'package:chronometro_mobx_modular/app/modules/search/presenter/search/controllers/search_page_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/data/repositories/search_repository_impl.dart';
import 'modules/search/domain/impl/search_by_text_impl.dart';
import 'modules/search/external/datasource/github_datasource.dart';
import 'modules/search/presenter/search/search_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => SearchByTextImpl(i())),
    Bind((i) => GithubDatasource(i())),
    Bind((i) => SearchPageStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SearchPage()),
  ];
}
