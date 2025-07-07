import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc.dart';
import 'package:plant_store/presentation/cart/bloc/cart_bloc_events.dart';
import 'package:plant_store/presentation/cart/models/cart_product_model.dart';

class CartProductCard extends HookWidget {
  const CartProductCard({
    super.key,
    required this.cartProduct,
    required this.checkBoxListOfProducts,
  });
  final CartProductModel cartProduct;
  final ValueNotifier<List<CartProductModel>> checkBoxListOfProducts;

  void cartAddButtonLogic(
      {required BuildContext context, required ValueNotifier<int> quantity}) {
    quantity.value++;

    if (quantity.value >= cartProduct.product.quantity) {
      return;
    }

    List<CartProductModel> list = [...List.from(checkBoxListOfProducts.value)];

    for (int i = 0; i < list.length; i++) {
      if (list[i] == cartProduct) {
        list[i] =
            list[i].copyWith(productQuantity: list[i].productQuantity + 1);
        checkBoxListOfProducts.value = List.from(list);
        return;
      }
    }

    context.read<CartBloc>().add(
          OnAddProductToCart(
              product: cartProduct.product,
              quantity: quantity.value,
              context: context),
        );
  }

  void cartRemoveButtonLogic(
      {required BuildContext context, required ValueNotifier<int> quantity}) {
    List<CartProductModel> list = [...List.from(checkBoxListOfProducts.value)];

    for (int i = 0; i < list.length; i++) {
      if (list[i] == cartProduct) {
        list.removeAt(i);
        checkBoxListOfProducts.value = List.from(list);
        break;
      }
    }
    // Removing Product From Cart
    context.read<CartBloc>().add(
          OnRemoveProductFromCart(
              product: cartProduct.product, context: context),
        );
  }

  void cartMinusButtonLogic(
      {required BuildContext context, required ValueNotifier<int> quantity}) {
    quantity.value--;
    if (quantity.value <= 0) {
      context.read<CartBloc>().add(OnRemoveProductFromCart(
          product: cartProduct.product, context: context));
      return;
    }

    List<CartProductModel> list = [...List.from(checkBoxListOfProducts.value)];

    for (int i = 0; i < list.length; i++) {
      if (list[i] == cartProduct) {
        list[i] =
            list[i].copyWith(productQuantity: list[i].productQuantity - 1);
        checkBoxListOfProducts.value = List.from(list);
        return;
      }
    }
    context.read<CartBloc>().add(OnMinusProductFromCart(
        product: cartProduct.product,
        quantity: quantity.value,
        context: context));
  }

  @override
  Widget build(BuildContext context) {
    final quantity = useState(cartProduct.productQuantity);
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        height: 107.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: Row(
          spacing: 15.w,
          children: [
            // CheckBox Section
            Transform.scale(
              scale: 1.15.r,
              child: Checkbox.adaptive(
                activeColor: colors.ff221fif,
                overlayColor: WidgetStatePropertyAll(colors.transparent),
                side: BorderSide(color: colors.ff221fif, width: 1.1.r),
                value: checkBoxListOfProducts.value.contains(cartProduct),
                onChanged: (value) {
                  var list = [...List.from(checkBoxListOfProducts.value)];
                  for (int i = 0; i < list.length; i++) {
                    if (list[i] == cartProduct) {
                      list.removeAt(i);
                      checkBoxListOfProducts.value = List.from(list);
                      return;
                    }
                  }

                  list.add(cartProduct);
                  checkBoxListOfProducts.value = List.from(list);
                  log(checkBoxListOfProducts.value.toString());
                },
              ),
            ),
            // Product Image Section
            Container(
              width: 77.w,
              height: 77.h,
              decoration: BoxDecoration(
                color: colors.fff6f6f6,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.network(
                cartProduct.product.images.first,
                height: 77.h,
                width: 77.w,
                fit: BoxFit.contain,
              ),
            ),
            // Product Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        cartProduct.product.name,
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.sp,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "\$${cartProduct.product.price}",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff007537,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Cart Product Add Button Section
                          InkWell(
                            onTap: () => cartAddButtonLogic(
                                context: context, quantity: quantity),
                            child: Icon(
                              Icons.add_box_outlined,
                              size: 24.r,
                              color: colors.ff221fif,
                            ),
                          ),
                          SizedBox(
                            width: 35.w,
                            child: Text(
                              textAlign: TextAlign.center,
                              quantity.value.toString(),
                              style: AppTextStyles.lato.medium(
                                color: colors.ff221fif,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),

                          // Cart Product Minus Button Section
                          InkWell(
                            onTap: () => cartMinusButtonLogic(
                                context: context, quantity: quantity),
                            child: Icon(
                              Icons.indeterminate_check_box_outlined,
                              size: 24.r,
                              color: colors.ff221fif,
                            ),
                          ),
                        ],
                      ),
                      // Remove Button Section
                      InkWell(
                        onTap: () => cartRemoveButtonLogic(
                            context: context, quantity: quantity),
                        overlayColor: WidgetStatePropertyAll(colors.fff6f6f6),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: colors.ff221fif, width: 1.2.r),
                            ),
                          ),
                          child: Text(
                            texts.remove,
                            style: AppTextStyles.lato.medium(
                              color: colors.ff221fif,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
