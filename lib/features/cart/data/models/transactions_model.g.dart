// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) =>
    TransactionsModel(
      address: json['address'] as String,
      date: DateTime.parse(json['date'] as String),
      email: json['email'] as String,
      mainImage: json['mainImage'] as String,
      paymentMethod: json['paymentMethod'] as String,
      phoneNumber: json['phoneNumber'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$TransactionsModelToJson(TransactionsModel instance) =>
    <String, dynamic>{
      'mainImage': instance.mainImage,
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'email': instance.email,
      'username': instance.username,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'products': instance.products,
    };
