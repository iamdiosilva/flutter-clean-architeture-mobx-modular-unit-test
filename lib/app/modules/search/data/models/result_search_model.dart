import '../../domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  ResultSearchModel({
    required super.title,
    required super.content,
    required super.img,
  });

  factory ResultSearchModel.fromJson(Map<String, dynamic> json) {
    return ResultSearchModel(
      title: json['title'],
      content: json['content'],
      img: json['img'],
    );
  }
}
