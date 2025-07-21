// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_router.dart';
import 'package:plant_store/core/utils/loading_state.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/features/cart/data/datasources/transactions_remote_datasource.dart';
import 'package:plant_store/features/cart/data/repositories/transactions_repository_implementation.dart';
import 'package:plant_store/features/cart/domain/usecases/get_transactions_usecase.dart';
import 'package:plant_store/features/cart/domain/usecases/save_transaction_usecase.dart';
import 'package:plant_store/features/cart/presentation/blocs/cart/cart_bloc.dart';
import 'package:plant_store/features/cart/presentation/blocs/cart/cart_bloc_events.dart';
import 'package:plant_store/features/cart/presentation/blocs/checkout/checkout_bloc_events.dart';
import 'package:plant_store/features/cart/presentation/blocs/checkout/checkout_bloc_states.dart';
import 'package:plant_store/features/home/data/datasources/products_remote_data_sources.dart';
import 'package:plant_store/features/home/data/repositories/products_repository_implementation.dart';
import 'package:plant_store/features/home/domain/usecases/update_products_quantity_usecase.dart';
import 'package:plant_store/features/main/main_screen.dart';

class CheckoutBloc extends Bloc<CheckoutBlocEvents, CheckoutBlocStates> {
  CheckoutBloc()
      : super(CheckoutBlocStates(transactionsList: [], isLoading: false)) {
    final repository = TransactionsRepositoryImplementation(
        remoteDatasource: TransactionsRemoteDatasource());
    final productsRepository = ProductsRepositoryImplementation(
        remoteDataSources: ProductsRemoteDataSources());
    final saveTransactionsUsecase =
        SaveTransactionUsecase(repository: repository);
    final updateProductsQuantityUsecase =
        UpdateProductsQuantityUsecase(repository: productsRepository);

    final getTransactionsUsecase =
        GetTransactionsUsecase(repository: repository);

    final texts = ConstTexts();

    final colors = ConstColors();

    on<OnCheckoutClicked>(
      (event, emit) async {
        try {
          emit(state.copyWith(isLoading: true));
          loadingState(event.context, colors);

          if (event.transactionsModel.address.isEmpty) {
            Toastification.warning(event.context, texts.addressCanNotBeEmpty);
            AppRouter.close();
            return;
          }

          if (event.transactionsModel.email.isEmpty) {
            Toastification.warning(event.context, texts.emailCanNotBeEmpty);
            AppRouter.close();
            return;
          }

          if (event.transactionsModel.phoneNumber.isEmpty) {
            Toastification.warning(
                event.context, texts.phoneNumberCanNotBeEmpty);
            AppRouter.close();
            return;
          }

          if (event.transactionsModel.username.isEmpty) {
            Toastification.warning(event.context, texts.usernameCanNotBeEmpty);
            AppRouter.close();
            return;
          }

          // Saving Transaction to the FirebaseStore
          await saveTransactionsUsecase(transaction: event.transactionsModel);

          // Removing Checkout Products from Cart
          for (var elem in event.listOfCheckoutProducts) {
            event.context.read<CartBloc>().add(OnRemoveProductFromCart(
                product: elem.product, context: event.context));
          }

          await updateProductsQuantityUsecase(
              productsList: event.listOfCheckoutProducts);

          emit(state.copyWith(isLoading: false));
          AppRouter.close();
          // Showing Go Home Screen Dialog
          if (event.context.mounted) {
            await showSuccesDialog(colors, event);
          } else {
            log("Context is not mounted");
          }
        } catch (e) {
          emit(state.copyWith(isLoading: false));
          AppRouter.close();
          log(e.toString());
        }
      },
    );

    on<OnGetTransactionsClicked>(
      (event, emit) async {
        try {
          emit(
              state.copyWith(transactionsList: await getTransactionsUsecase()));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }
}

Future<dynamic> showSuccesDialog(ConstColors colors, OnCheckoutClicked event) {
  return showDialog(
      barrierDismissible: false,
      barrierColor: colors.ff221fif.withValues(alpha: 0.2),
      context: event.context,
      builder: (context) => AlertDialog.adaptive(
            backgroundColor: colors.ffffffff,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Success",
                  style: AppTextStyles.lato
                      .bold(color: colors.ff221fif, fontSize: 25.sp),
                ),
              ],
            ),
            content: Text(
              "Successfully finished checkout.",
              style: AppTextStyles.lato
                  .regular(color: colors.ff221fif, fontSize: 16.sp),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextButton(
                        buttonText: "Go Home Screen",
                        textColor: colors.ffffffff,
                        backgroundColor: colors.ff007537,
                        func: () {
                          AppRouter.open(MainScreen());
                        }),
                  )
                ],
              )
            ],
          ));
}
