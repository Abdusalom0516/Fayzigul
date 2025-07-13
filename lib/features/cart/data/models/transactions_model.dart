import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/domain/entities/transactions_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'transactions_model.g.dart';

@JsonSerializable()
class TransactionsModel extends TransactionsEntity {
  const TransactionsModel({
    required super.address,
    required super.date,
    required super.email,
    required super.mainImage,
    required super.paymentMethod,
    required super.phoneNumber,
    required super.products,
    required super.status,
    required super.username,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsModelToJson(this);
}
