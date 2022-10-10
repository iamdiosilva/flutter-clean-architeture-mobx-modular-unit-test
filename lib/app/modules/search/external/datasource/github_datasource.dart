import 'package:chronometro_mobx_modular/app/modules/search/data/models/result_search_model.dart';
import 'package:chronometro_mobx_modular/app/modules/search/domain/errors/errors.dart';
import 'package:dio/dio.dart';

import '../../data/datasource/search_datasource.dart';

class GithubDatasource implements SearchDatasource {
  final Dio dio;

  GithubDatasource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get(_normalizeText(searchText));

    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromJson(e))
          .toList();

      return list;
    } else {
      throw DatasourceError('Erro ao buscar dados');
    }
  }

  _normalizeText(String searchText) {
    return searchText.replaceAll(' ', '+');
  }
}
