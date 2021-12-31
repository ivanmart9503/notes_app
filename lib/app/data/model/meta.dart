import 'package:notes/app/data/model/pagination.dart';

class Meta {
  final Pagination pagination;

  const Meta({this.pagination = const Pagination()});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : const Pagination(),
    );
  }
}
