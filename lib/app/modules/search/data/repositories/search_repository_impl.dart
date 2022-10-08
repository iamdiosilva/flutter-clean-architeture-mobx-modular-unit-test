import 'package:dartz/dartz.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasource/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;
  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> search(
      String? searchText) async {
    try {
      final result = await datasource.getSearch(searchText!);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(DatasourceError(e.message));
    } catch (e) {
      return Left(DatasourceError('Erro ao buscar dados'));
    }
  }
}
