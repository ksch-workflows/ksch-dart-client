// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageLinks _$PageLinksFromJson(Map<String, dynamic> json) {
  return PageLinks(
    self: Link.fromJson(json['self'] as Map<String, dynamic>),
    first: json['first'] == null
        ? null
        : Link.fromJson(json['first'] as Map<String, dynamic>),
    prev: json['prev'] == null
        ? null
        : Link.fromJson(json['prev'] as Map<String, dynamic>),
    next: json['next'] == null
        ? null
        : Link.fromJson(json['next'] as Map<String, dynamic>),
    last: json['last'] == null
        ? null
        : Link.fromJson(json['last'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PageLinksToJson(PageLinks instance) => <String, dynamic>{
      'self': instance.self.toJson(),
      'first': instance.first?.toJson(),
      'prev': instance.prev?.toJson(),
      'next': instance.next?.toJson(),
      'last': instance.last?.toJson(),
    };

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    size: json['size'] as int,
    totalElements: json['totalElements'] as int,
    totalPages: json['totalPages'] as int,
    number: json['number'] as int,
  );
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'number': instance.number,
    };
