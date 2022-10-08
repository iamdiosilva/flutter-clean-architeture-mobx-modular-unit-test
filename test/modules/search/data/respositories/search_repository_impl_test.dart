import 'package:chronometro_mobx_modular/app/modules/search/data/datasource/search_datasource.dart';
import 'package:chronometro_mobx_modular/app/modules/search/data/models/result_search_model.dart';
import 'package:chronometro_mobx_modular/app/modules/search/data/repositories/search_repository_impl.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/entities/result_search.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);
  test('Deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch('any'))
        .thenThrow((_) async => <ResultSearchModel>[]);
    final result = await repository.search('searchText');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar Datasource Error se falhar', () async {
    when(datasource.getSearch('any'))
        .thenThrow(DatasourceError('Erro ao buscar dados'));
    final result = await repository.search('searchText');
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
