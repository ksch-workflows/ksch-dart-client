import 'package:json_annotation/json_annotation.dart';

import 'hateoas.dart';

part 'pagination.g.dart';

@JsonSerializable()
class PageLinks {
  final Link self;

  /// The link to the first page.
  final Link? first;

  /// The link to the previous page.
  final Link? prev;

  /// The link to the next page.
  final Link? next;

  /// The link to the last page.
  final Link? last;

  PageLinks({
    required this.self,
    this.first,
    this.prev,
    this.next,
    this.last,
  });

  factory PageLinks.fromJson(Map<String, dynamic> json) =>
      _$PageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinksToJson(this);
}

@JsonSerializable()
class Page {
  final int size;
  final int totalElements;
  final int totalPages;
  final int number;

  Page({
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}

mixin PageNavigation {
  Page get page;

  PageLinks get links;

  bool get hasNextPage {
    return links.next != null;
  }

  int? get nextPage {
    var totalPages = page.totalPages;
    var currentPage = page.number;

    if (currentPage + 1 < totalPages) {
      return currentPage + 1;
    }
  }

  int get firstPage {
    return 0;
  }

  int get lastPage {
    if (page.totalPages > 0) {
      return page.totalPages - 1;
    } else {
      return 0;
    }
  }
}
