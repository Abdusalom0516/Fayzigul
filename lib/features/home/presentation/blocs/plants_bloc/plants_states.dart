import 'package:equatable/equatable.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';

abstract class PlantsBlocStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlantsBlocInitialState extends PlantsBlocStates {}

class PlantsBlocLoadingState extends PlantsBlocStates {}

class PlantsBlocSuccessState extends PlantsBlocStates {
  final List<ProductModel> products;

  PlantsBlocSuccessState({required this.products});
}

class PlantsBlocFailureState extends PlantsBlocStates {
  final String message;
  PlantsBlocFailureState({required this.message});
}
