import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/data/repositories/search_repository_impl.dart';
import 'modules/search/domain/impl/search_by_text_impl.dart';
import 'modules/search/external/datasource/github_datasource.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => SearchByTextImpl(i())),
    Bind((i) => GithubDatasource(i())),
  ];

  @override
  final List<ModularRoute> routes = [];
}
