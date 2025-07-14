// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:plant_store/features/cart/data/repositories/cart_repository_implementation.dart';
import 'package:plant_store/features/cart/domain/usecases/get_cart_list_usecase.dart';
import 'package:plant_store/features/cart/domain/usecases/save_cart_list_usecase.dart';
import 'package:plant_store/features/cart/presentation/blocs/cart/cart_bloc_events.dart';
import 'package:plant_store/features/cart/presentation/blocs/cart/cart_bloc_states.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';

class CartBloc extends Bloc<CartBlocEvents, CartBlocStates> {
  CartBloc() : super(CartBlocStates(cartProductsList: [])) {
    ConstTexts texts = ConstTexts();
    final CartRepositoryImplementation repository =
        CartRepositoryImplementation(localDataSource: CartLocalDataSource());

    final getCartListUsecase = GetCartListUsecase(repository: repository);
    final saveCartListUsecase = SaveCartListUsecase(repository: repository);

    // Event Handling for OnAddProductEvent Event
    on<OnAddProductToCart>(
      (event, emit) async {
        // Cart Product List
        List<CartProductModel> cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        try {
          for (int i = 0; i < cartProductList.length; i++) {
            if (event.product.id == cartProductList[i].product.id) {
              cartProductList[i] = cartProductList[i].copyWith(
                  productQuantity: cartProductList[i].productQuantity + 1);

              emit(
                  CartBlocStates(cartProductsList: List.from(cartProductList)));

              await saveCartListUsecase(cartList: cartProductList);

              Toastification.success(
                  event.context, texts.productQuantityUpdatedSuc);
              return;
            }
          }

          cartProductList.add(CartProductModel(
              product: event.product, productQuantity: event.quantity));
          emit(CartBlocStates(cartProductsList: List.from(cartProductList)));
          await saveCartListUsecase(cartList: cartProductList);
          log("${cartProductList.length} length of the list.");
          Toastification.success(event.context, texts.productAddedSuc);
        } catch (e) {
          Toastification.error(
              event.context, texts.failedToAddProduct(e.toString()));
        }
      },
    );

    // Event Handling for OnMinusProductFromCart Event
    on<OnMinusProductFromCart>(
      (event, emit) async {
        // Cart Product List
        List<CartProductModel> cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        try {
          for (int i = 0; i < cartProductList.length; i++) {
            if (event.product.id == cartProductList[i].product.id) {
              cartProductList[i] = cartProductList[i].copyWith(
                  productQuantity: cartProductList[i].productQuantity - 1);

              emit(
                  CartBlocStates(cartProductsList: List.from(cartProductList)));
              await saveCartListUsecase(cartList: cartProductList);
              log("${cartProductList.length} length of the list.");
              Toastification.success(
                  event.context, texts.productQuantityUpdatedSuc);
              return;
            }
          }

          Toastification.warning(event.context, texts.productNotFoundInCart);
        } catch (e) {
          Toastification.error(
              event.context, texts.failedToMinues(e.toString()));
        }
      },
    );

    // Event Handling for OnRemoveProductFromCart Event
    on<OnRemoveProductFromCart>(
      (event, emit) async {
        // Cart Product List
        List<CartProductModel> cartProductList =
            List<CartProductModel>.from(state.cartProductsList);

        try {
          for (int i = 0; i < cartProductList.length; i++) {
            if (event.product.id == cartProductList[i].product.id) {
              cartProductList.removeAt(i);
              emit(CartBlocStates(cartProductsList: cartProductList));
              await saveCartListUsecase(cartList: cartProductList);
              Toastification.success(event.context, texts.productRemovedSuc);
              return;
            }
          }

          Toastification.warning(event.context, texts.productNotFoundInCart);
        } catch (e) {
          Toastification.error(
              event.context, texts.failedToRemove(e.toString()));
        }
      },
    );

    // Event Handling for OnCleanCart Event
    on<OnCleanCart>(
      (event, emit) async {
        emit(CartBlocStates(cartProductsList: []));
        await saveCartListUsecase(cartList: []);
        Toastification.success(event.context, texts.cleanedCartSuccessfully);
      },
    );

    on<OnGetCartListClicked>((event, emit) async {
      emit(CartBlocStates(cartProductsList: await getCartListUsecase()));
    });
  }
}
