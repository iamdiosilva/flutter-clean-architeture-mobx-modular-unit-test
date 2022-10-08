import 'package:chronometro_mobx_modular/app/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>?>> call(String? searchText);
}
