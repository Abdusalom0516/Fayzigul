import 'package:plant_store/features/cart/entities/cart_product_entity.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:plant_store/features/home/models/product_model.dart';

part 'cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel extends CartEntity {
  const CartProductModel({
    required super.product,
    required super.productQuantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);

  CartProductModel copyWith({ProductModel? product, int? productQuantity}) {
    return CartProductModel(
      product: product ?? this.product,
      productQuantity: productQuantity ?? this.productQuantity,
    );
  }
}
