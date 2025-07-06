import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_events.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_states.dart';
import 'package:plant_store/presentation/cart/models/cart_product_model.dart';

class CartBloc extends Bloc<CartBlocEvents, CartBlocStates> {
  CartBloc() : super(CartBlocStates(cartProductsList: [])) {
    // Event Handling for OnAddProductEvent Event
    on<OnAddProductToCart>(
      (event, emit) {
        // Cart Product List
        var cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        for (int i = 0; i < cartProductList.length; i++) {
          if (event.product.id == cartProductList[i].product.id) {
            cartProductList[i] = cartProductList[i].copyWith(
                productQuantity:
                    event.quantity + cartProductList[i].productQuantity);

            emit(CartBlocStates(cartProductsList: cartProductList));
            return;
          }
        }

        cartProductList.add(CartProductModel(
            product: event.product, productQuantity: event.quantity));
      },
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
