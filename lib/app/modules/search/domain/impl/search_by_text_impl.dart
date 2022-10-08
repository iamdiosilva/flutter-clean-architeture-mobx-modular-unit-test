import 'package:dartz/dartz.dart';

import '../entities/result_search.dart';
import '../errors/errors.dart';
import '../repositories/search_repository.dart';
import '../use_cases/search_by_text.dart';

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> call(
      String? searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError('Texto inválido'));
    }

    return await repository.search(searchText);
  }
}
