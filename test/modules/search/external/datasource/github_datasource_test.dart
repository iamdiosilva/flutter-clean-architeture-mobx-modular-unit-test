import 'dart:convert';

import 'package:chronometro_mobx_modular/app/modules/search/domain/errors/errors.dart';
import 'package:chronometro_mobx_modular/app/modules/search/external/datasource/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = Dio();
  final datasource = GithubDatasource(dio);
  test('Deve retornar uma lista de ResultSearchModel', () async {
    when(dio.get('any')).thenAnswer((_) async => Response(
        data: jsonDecode(githubResult),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
    final future = datasource.getSearch('searchText');
    expect(future, completes);
  });
  test('Deve retornar um erro se o codigo nao for 200', () async {
    when(dio.get('any')).thenAnswer((_) async => Response(
        data: null, statusCode: 401, requestOptions: RequestOptions(path: '')));
    final future = datasource.getSearch('searchText');
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('Deve retornar uma Exception se tiver um erro no dio', () async {
    when(dio.get('any')).thenThrow(Exception());
    final future = datasource.getSearch('searchText');
    expect(future, throwsA(isA<Exception>()));
  });
}
