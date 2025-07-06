import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_events.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_states.dart';
import 'package:plant_store/presentation/cart/models/cart_product_model.dart';

class CartBloc extends Bloc<CartBlocEvents, CartBlocStates> {
  CartBloc() : super(CartBlocStates(cartProductsList: [])) {
    // Event Handling for OnAddProductEvent Event
    on<OnAddProductToCart>(
      (event, emit) {
        // Cart Product List
        List<CartProductModel> cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        try {
          for (int i = 0; i < cartProductList.length; i++) {
            if (event.product.id == cartProductList[i].product.id) {
              cartProductList[i] = cartProductList[i].copyWith(
                  productQuantity:
                      event.quantity + cartProductList[i].productQuantity);

              emit(CartBlocStates(cartProductsList: cartProductList));
              Toastification.success(event.context,
                  "Product quantity updated in Cart successfully.");
              return;
            }
          }

          cartProductList.add(CartProductModel(
              product: event.product, productQuantity: event.quantity));
          Toastification.success(
              event.context, "Product added to Cart successfully.");
        } catch (e) {
          Toastification.error(event.context, "Failed to add product $e.");
        }
      },
    );

    // Event Handling for OnMinusProductFromCart Event
    on<OnMinusProductFromCart>(
      (event, emit) {
        // Cart Product List
        List<CartProductModel> cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        try {
          for (int i = 0; i < cartProductList.length; i++) {
            if (event.product.id == cartProductList[i].product.id) {
              cartProductList[i] = cartProductList[i].copyWith(
                  productQuantity:
                      cartProductList[i].productQuantity - event.quantity);

              emit(CartBlocStates(cartProductsList: cartProductList));
              Toastification.success(event.context,
                  "Product quantity updated in Cart successfully.");
              return;
            }
          }

          Toastification.warning(event.context, "Product not found in Cart.");
        } catch (e) {
          Toastification.error(
              event.context, "Failed to minus product quantity $e.");
        }
      },
    );

    // Event Handling for OnRemoveProductFromCart Event
    on<OnRemoveProductFromCart>(
      (event, emit) {
        // Cart Product List
        List<CartProductModel> cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        try {
          for (int i = 0; i < cartProductList.length; i++) {
            if (event.product.id == cartProductList[i].product.id) {
              cartProductList.removeAt(i);
              emit(CartBlocStates(cartProductsList: cartProductList));
              Toastification.success(
                  event.context, "Product removed from Cart successfully.");
              return;
            }
          }

          Toastification.warning(event.context, "Product not found in Cart.");
        } catch (e) {
          Toastification.error(event.context, "Failed to remove product $e.");
        }
      },
    );
  }
}
