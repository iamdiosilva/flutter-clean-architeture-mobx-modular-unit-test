import 'dart:convert';

import 'package:chronometro_mobx_modular/app/app_module.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/entities/result_search.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/impl/search_by_text_impl.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/use_cases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import '../modules/search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  initModule(AppModule(), replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);
  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve trazer uma lista de Resultsearch', () async {
    when(dio.get('any')).thenAnswer(
      (_) async => Response(
          requestOptions: RequestOptions(path: 'any'),
          data: jsonDecode(githubResult),
          statusCode: 200),
    );
    final usecase = Modular.get<SearchByText>();
    final result = await usecase.call('Diogenes');

    expect(result | null, isA<List<ResultSearch>>());
  });
}
