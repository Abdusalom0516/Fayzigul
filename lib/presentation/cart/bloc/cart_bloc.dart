import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_events.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_states.dart';

class CartBloc extends Bloc<CartBlocEvents, CartBlocStates> {
  CartBloc() : super(CartBlocStates(cartProductsList: [])) {

    // Event Handling for OnAddProductEvent Event
    on<OnAddProductToCart>(
      (event, emit) {},
    );

    // Event Handling for OnMinusProductFromCart Event
    on<OnMinusProductFromCart>(
      (event, emit) {},
    );

    // Event Handling for OnRemoveProductFromCart Event
    on<OnRemoveProductFromCart>(
      (event, emit) {},
    );
  }
}
