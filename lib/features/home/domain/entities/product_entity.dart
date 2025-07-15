import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  final String id, name, description, origin, instruction, massType;
  final double price, mass;
  final int quantity;
  final Map<String, String> basicKnowladge, stages;
  final List<String> images, categories;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.origin,
    required this.basicKnowladge,
    required this.description,
    required this.instruction,
    required this.mass,
    required this.massType,
    required this.quantity,
    required this.stages,
    required this.categories,
    required this.images,
  });

  @override
  List<Object?> get props => [id, name, origin, price];
}
