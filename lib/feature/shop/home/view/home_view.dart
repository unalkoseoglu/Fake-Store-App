import 'package:easy_localization/easy_localization.dart';
import 'package:fake_store/core/init/app/base/base_view.dart';
import 'package:fake_store/core/init/constants/image_constants.dart';
import 'package:fake_store/feature/shop/home/model/product_model.dart';

import 'package:fake_store/product/base/base_state.dart';
import 'package:fake_store/product/init/lang/locale_keys.g.dart';

import 'package:fake_store/product/widget/button/custom_icon_button.dart';
import 'package:fake_store/product/widget/field/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../../../product/widget/card/discount_card.dart';
import '../../../../product/widget/card/product_card.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget with BaseState {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (model) {
        model.networkService.networkManager;
        model.init();
        model.setContext(context);
      },
      builder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.horizontalPaddingLow,
          child: ListView(
            shrinkWrap: true,
            children: [
              context.emptySizedHeightBoxLow3x,
              const _headerTitle(),
              context.emptySizedHeightBoxLow3x,
              const _searchBar(),
              context.emptySizedHeightBoxLow3x,
              DiscountCard(viewModel: viewModel),
              context.emptySizedHeightBoxLow,
              _newArrivals(context),
              context.emptySizedHeightBoxLow,
              Observer(builder: (_) {
                return _productCard(context, viewModel.products);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _productCard(BuildContext context, List<ProductModel> items) {
    return items.isEmpty
        ? Center(
            child: Lottie.asset(ImageConstants.instance.lottiePath.ecommerce,
                height: context.dynamicHeight(0.3)),
          )
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: context.dynamicHeight(0.28)),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ProductCard(
                onTap: () {
                  HomeViewModel().sendItemID((items[index].id! - 1));
                },
                items: items,
                index: index,
              );
            });
  }

  Row _newArrivals(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title(context, LocaleKeys.home_newArrials.tr()),
        TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.home_viewAll.tr(),
              style: context.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.grey),
            ))
      ],
    );
  }

  Padding _title(BuildContext context, String title) {
    return Padding(
      padding: context.onlyLeftPaddingNormal,
      child: Text(
        title,
        style:
            context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _searchBar extends StatelessWidget {
  const _searchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Row(
        children: [
          const Expanded(
            flex: 11,
            child: SearchField(),
          ),
          context.emptySizedWidthBoxLow3x,
          const Expanded(
              flex: 2,
              child: CustomIconButton(
                height: .06,
                icon: Icons.manage_search_outlined,
                iconSize: 24,
              ))
        ],
      ),
    );
  }
}

class _headerTitle extends StatelessWidget {
  const _headerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${LocaleKeys.home_welcome.tr()},',
                  style: context.textTheme.headline4!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w800)),
              context.emptySizedHeightBoxLow,
              Text(LocaleKeys.home_ourFashionsApp.tr(),
                  style: context.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
