import 'package:equatable/equatable.dart';
import 'package:plant_store/presentation/home/models/product_model.dart';

abstract class HomeScreenStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeScreenInitialState extends HomeScreenStates {}

class HomeScreenLoadingState extends HomeScreenStates {}

class HomeScreenSuccessState extends HomeScreenStates {
  final List<ProductModel> products;

  HomeScreenSuccessState({required this.products});
}

class HomeScreenFailureState extends HomeScreenStates {
  final String message;
  HomeScreenFailureState({required this.message});
}
