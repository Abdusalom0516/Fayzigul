// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      origin: json['origin'] as String,
      basicKnowladge: (json['basicKnowladge'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      description: json['description'] as String,
      instruction: json['instruction'] as String,
      mass: (json['mass'] as num).toDouble(),
      massType: json['massType'] as String,
      quantity: (json['quantity'] as num).toInt(),
      stages: (json['stages'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'origin': instance.origin,
      'instruction': instance.instruction,
      'massType': instance.massType,
      'price': instance.price,
      'mass': instance.mass,
      'quantity': instance.quantity,
      'basicKnowladge': instance.basicKnowladge,
      'stages': instance.stages,
      'images': instance.images,
      'categories': instance.categories,
    };
