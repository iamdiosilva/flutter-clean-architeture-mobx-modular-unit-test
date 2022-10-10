import 'package:mobx/mobx.dart';

import '../../../data/models/result_search_model.dart';
import '../../../domain/use_cases/search_by_text.dart';
import '../../../external/datasource/github_datasource.dart';
part 'search_page_store.g.dart';

// ignore: library_private_types_in_public_api
class SearchPageStore = _SearchPageStoreBase with _$SearchPageStore;

abstract class _SearchPageStoreBase with Store {
  @observable
  GithubDatasource usecase;

  _SearchPageStoreBase(this.usecase);

  @observable
  List<ResultSearchModel> results = [];

  @action
  Future<void> search(String searchText) async {
    results = await usecase.getSearch(searchText);
  }
}
