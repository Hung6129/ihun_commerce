// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  /// The generated code assumes these values exist in JSON.
  final int id;
  final String? title;
  final double? price;
  final String? descr;
  final String? cate;
  final String? image;

  Product({
    required this.id,
    this.title,
    this.price,
    this.descr,
    this.cate,
    this.image,
  });

  /// Connect the generated [_$ProductFromJson] function to the `fromJson`
  /// factory.
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Connect the generated [_$ProductToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
