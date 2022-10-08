import 'package:chronometro_mobx_modular/app/modules/search/domain/entities/result_search.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/errors/errors.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/impl/search_by_text_impl.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final useCase = SearchByTextImpl(repository);
  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    final result = await useCase.call('searchText');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar uma Exception caso o texto seja invalido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => const Right(<ResultSearch>[]));

    final result = await useCase.call(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
