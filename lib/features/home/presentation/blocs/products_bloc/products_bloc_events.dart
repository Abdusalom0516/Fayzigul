import 'package:equatable/equatable.dart';

abstract class ProductsBlocEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnGetProductsClicked extends ProductsBlocEvents {}
