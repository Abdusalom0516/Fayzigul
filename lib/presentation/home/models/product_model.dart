import 'package:plant_store/presentation/home/entities/product_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.origin,
    required super.basicKnowladge,
    required super.description,
    required super.instruction,
    required super.mass,
    required super.massType,
    required super.quantity,
    required super.stages,
    required super.images,
    required super.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductModel copyWith({
    String? name,
    String? description,
    String? origin,
    String? instruction,
    String? massType,
    double? price,
    double? mass,
    String? id,
    int? quantity,
    Map<String, String>? basicKnowladge,
    Map<String, String>? stages,
    List<String>? images,
    List<String>? categories,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      origin: origin ?? this.origin,
      basicKnowladge: basicKnowladge ?? this.basicKnowladge,
      description: description ?? this.description,
      instruction: instruction ?? this.instruction,
      mass: mass ?? this.mass,
      massType: massType ?? this.massType,
      quantity: quantity ?? this.quantity,
      stages: stages ?? this.stages,
      images: images ?? this.images,
      categories: categories ?? this.images,
    );
  }
}
