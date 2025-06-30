import 'package:equatable/equatable.dart';
import 'package:plant_store/presentation/home/models/product_model.dart';

abstract class EquipmentsBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EquipmentsBlocInitialState extends EquipmentsBlocState {}

class EquipmentsBlocLoadingState extends EquipmentsBlocState {}

class EquipmentsBlocFailureState extends EquipmentsBlocState {
  final String message;

  EquipmentsBlocFailureState({required this.message});
}

class EquipmentsBlocSuccessState extends EquipmentsBlocState {
  final List<ProductModel> listOfProducts;

  EquipmentsBlocSuccessState({required this.listOfProducts});
}
