// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPageStore on _SearchPageStoreBase, Store {
  late final _$usecaseAtom =
      Atom(name: '_SearchPageStoreBase.usecase', context: context);

  @override
  GithubDatasource get usecase {
    _$usecaseAtom.reportRead();
    return super.usecase;
  }

  @override
  set usecase(GithubDatasource value) {
    _$usecaseAtom.reportWrite(value, super.usecase, () {
      super.usecase = value;
    });
  }

  late final _$resultsAtom =
      Atom(name: '_SearchPageStoreBase.results', context: context);

  @override
  List<ResultSearchModel> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<ResultSearchModel> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$searchAsyncAction =
      AsyncAction('_SearchPageStoreBase.search', context: context);

  @override
  Future<void> search(String searchText) {
    return _$searchAsyncAction.run(() => super.search(searchText));
  }

  @override
  String toString() {
    return '''
usecase: ${usecase},
results: ${results}
    ''';
  }
}
