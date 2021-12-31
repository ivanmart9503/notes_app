class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;
  final bool hasReachedMax;

  const Pagination({
    this.page = 0,
    this.pageSize = 0,
    this.pageCount = 0,
    this.total = 0,
    this.hasReachedMax = false,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pageSize: json['pageSize'],
      pageCount: json['pageCount'],
      total: json['total'],
      hasReachedMax:
          json['pageCount'] == 0 || (json['page'] == json['pageCount']),
    );
  }
}
