// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      productQuantity: (json['productQuantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'productQuantity': instance.productQuantity,
    };
