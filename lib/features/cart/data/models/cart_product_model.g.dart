// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<dynamic, dynamic> json) =>
    CartProductModel(
      product: ProductModel.fromJson(json['product'] as Map<dynamic, dynamic>),
      productQuantity: (json['productQuantity'] as num).toInt(),
    );

Map<dynamic, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <dynamic, dynamic>{
      'product': instance.product.toJson(),
      'productQuantity': instance.productQuantity,
    };
