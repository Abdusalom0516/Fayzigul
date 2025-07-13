import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/cart/presentation/blocs/checkout/checkout_bloc.dart';
import 'package:plant_store/features/cart/presentation/blocs/checkout/checkout_bloc_states.dart';
import 'package:plant_store/features/profile/widgets/transactions_card_wd.dart';

class TransactionsHistoryScreen extends StatelessWidget {
  const TransactionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: BlocBuilder<CheckoutBloc, CheckoutBlocStates>(
          builder: (context, state) => CustomScrollView(
            slivers: [
              // Sliver Appbar Section
              appBarSection(colors, texts),
              SliverHeight(height: 15),
              // ListView.builder Transaction Cards Section
              lisViewTransactionCardsSection(state: state),
              SliverHeight(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  SliverList lisViewTransactionCardsSection(
      {required CheckoutBlocStates state}) {
    return SliverList.builder(
      itemCount: state.transactionsList.length,
      itemBuilder: (context, index) => TransactionsCard(transactionsModel: state.transactionsList[index],),
    );
  }

  SliverAppBar appBarSection(ConstColors colors, ConstTexts texts) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      backgroundColor: colors.ffffffff,
      title: Text(
        texts.transactionsHistory,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}
