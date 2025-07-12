import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/common/widgets/custom_empty_center_text_wd.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_height_wd.dart';
import 'package:plant_store/core/common/widgets/custom_sliver_sizedbox_shrink.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';
import 'package:plant_store/features/search/presentation/blocs/search_history_bloc.dart';
import 'package:plant_store/features/search/presentation/blocs/search_history_events.dart';
import 'package:plant_store/features/search/presentation/blocs/search_history_states.dart';
import 'package:plant_store/features/search/widgets/search_history_card_wd.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    useEffect(
      () {
        controller.clear();
        return null;
      },
    );
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: BlocBuilder<SearchHistoryBloc, SearchHistoryStates>(
          builder: (context, state) => CustomScrollView(
            slivers: [
              // Search Screen AppBar Section
              searchScreenAppBarSection(colors, texts),
              SliverHeight(height: 15),
              // Search Screen TextField Section
              searchScreenTextFieldSection(
                  colors: colors,
                  context: context,
                  controller: controller,
                  texts: texts),
              SliverHeight(height: 35),
              // Search History Recent Searches Title Section
              state.listOfSearchHistories.isEmpty || state.isSearching
                  ? CustomSliverSizedBoxShrink()
                  : searchHistoryRecentSearchesTitleSection(
                      colors: colors, state: state, texts: texts),
              state.listOfSearchHistories.isEmpty || state.isSearching
                  ? CustomSliverSizedBoxShrink()
                  : SliverHeight(height: 15),
              // Search History Options Section
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 35.r),
                sliver: state.listOfSearchHistories.isEmpty || state.isSearching
                    ? CustomSliverSizedBoxShrink()
                    : SliverList.builder(
                        itemCount: state.listOfSearchHistories.length,
                        itemBuilder: (context, index) => SearchHistoryCard(
                            title: state
                                .listOfSearchHistories[index].searchHistory),
                      ),
              ),
              // Search History Search Results ListView.builder Section
              !state.isSearching
                  ? CustomSliverSizedBoxShrink()
                  : state.listOfSearchedProducts.isEmpty
                      ? CustomEmptyCenterText(text: texts.noProductsFound)
                      : SliverList.builder(
                          itemCount: 11,
                          itemBuilder: (context, index) =>
                              SearchResultProductsCard(),
                        ),
              SliverHeight(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  SliverPadding searchHistoryRecentSearchesTitleSection(
      {required ConstTexts texts,
      required ConstColors colors,
      required SearchHistoryStates state}) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 35.r),
      sliver: SliverToBoxAdapter(
        child: state.listOfSearchHistories.isEmpty
            ? SizedBox.shrink()
            : Row(
                children: [
                  Text(
                    texts.recentSearches,
                    style: AppTextStyles.lato.semiBold(
                      color: colors.ff221fif,
                      fontSize: 19.sp,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  SliverPadding searchScreenTextFieldSection(
      {required BuildContext context,
      required ConstColors colors,
      required TextEditingController controller,
      required ConstTexts texts}) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colors.ff221fif,
                width: 1.3.r,
              ),
            ),
          ),
          child: TextField(
            cursorColor: colors.ff221fif,
            controller: controller,
            style: AppTextStyles.lato.regular(
              color: colors.ff221fif,
              fontSize: 17.sp,
            ),
            onSubmitted: (value) {
              context.read<SearchHistoryBloc>().add(OnSaveSearchHistoryClicked(
                  context: context,
                  searchHistory:
                      SearchHistoryModel(searchHistory: value.trim())));
            },
            onChanged: (value) {
              if (value.isEmpty) {
                context.read<SearchHistoryBloc>().add(OnSearchingEndClicked());
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 7.r),
              hint: Text(
                texts.search,
                style: AppTextStyles.lato.regular(
                  color: colors.ffababab,
                  fontSize: 17.sp,
                ),
              ),
              suffixIcon: Icon(
                Icons.search,
                size: 24.r,
                color: colors.ff221fif,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar searchScreenAppBarSection(ConstColors colors, ConstTexts texts) {
    return SliverAppBar(
      backgroundColor: colors.ffffffff,
      floating: true,
      pinned: true,
      centerTitle: true,
      title: Text(
        texts.search,
        style: AppTextStyles.lato.medium(
          color: colors.ff221fif,
          fontSize: 23.sp,
        ),
      ),
    );
  }
}

class SearchResultProductsCard extends StatelessWidget {
  const SearchResultProductsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        height: 107.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
        child: Row(
          spacing: 15.w,
          children: [
            // Search Card Image Part
            Container(
              height: 77.h,
              width: 77.w,
              decoration: BoxDecoration(
                color: colors.fff6f6f6,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                images.plant,
                height: 77.h,
                width: 77.w,
                fit: BoxFit.contain,
              ),
            ),
            // Search Card Texts Section
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
                        "Panse  | Hybrid",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.w,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "\$250",
                        style: AppTextStyles.lato.medium(
                          color: colors.ff221fif,
                          fontSize: 17.w,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "156 items left",
                    style: AppTextStyles.lato.regular(
                      color: colors.ff221fif,
                      fontSize: 15.w,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
