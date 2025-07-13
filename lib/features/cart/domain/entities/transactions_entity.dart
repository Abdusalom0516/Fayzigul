import 'package:equatable/equatable.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';

class TransactionsEntity extends Equatable {
  final String mainImage,
      status,
      paymentMethod,
      email,
      username,
      address,
      phoneNumber;
  final DateTime date;
  final List<CartProductModel> products;

  const TransactionsEntity({
    required this.address,
    required this.date,
    required this.email,
    required this.mainImage,
    required this.paymentMethod,
    required this.phoneNumber,
    required this.products,
    required this.status,
    required this.username,
  });

  @override
  List<Object?> get props => [mainImage, products, date, phoneNumber, username];
}
