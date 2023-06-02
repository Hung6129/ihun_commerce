// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      descr: json['descr'] as String?,
      cate: json['cate'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'descr': instance.descr,
      'cate': instance.cate,
      'image': instance.image,
    };
