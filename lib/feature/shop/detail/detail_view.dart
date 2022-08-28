import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import 'package:fake_store/feature/shop/home/viewModel/home_view_model.dart';
import 'package:fake_store/product/widget/appBar/sliver_app_bar.dart';

import '../../../core/init/app/base/base_view.dart';
import '../../../core/init/constants/image_constants.dart';
import '../home/model/product_model.dart';

class DetailView extends StatelessWidget {
  DetailView({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  int? selectedImage;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        model: HomeViewModel(),
        onModelReady: (model) {
          model.networkService.networkManager;
          model.init();
          model.setContext(context);
        },
        builder: (BuildContext context, HomeViewModel viewModel) =>
            Scaffold(body: Observer(builder: (_) {
              return viewModel.products.isEmpty
                  ? Center(
                      child: Lottie.asset(
                          ImageConstants.instance.lottiePath.ecommerce,
                          height: context.dynamicHeight(0.3)))
                  : CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        CustomSliverAppBar(
                            index: id,
                            selectedImage: selectedImage,
                            model: viewModel.products),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: context.paddingNormal,
                            child: SizedBox(
                              height: context.height,
                              width: context.width,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: context.colorScheme.surface,
                                    borderRadius: BorderRadius.only(
                                        topLeft: context.normalRadius,
                                        topRight: context.normalRadius)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildProductTitle(
                                              viewModel, context),
                                          _buildItemCont(context)
                                        ]),
                                    context.emptySizedHeightBoxNormal,
                                    _ItemImages(
                                        id: id, model: viewModel.products),
                                    _description(context, viewModel.products),
                                    context.emptySizedHeightBoxHigh,
                                    _buildAddtoCart(viewModel, context)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            })));
  }

  Row _buildAddtoCart(HomeViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$ ${viewModel.products[id].price}.00',
          style: context.textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.store_outlined),
            label: const Text('Add to Cart'))
      ],
    );
  }

  Column _description(BuildContext context, List<ProductModel> model) {
    return Column(children: [
      Text(
        'Description',
        style: context.textTheme.headline6,
        textAlign: TextAlign.left,
      ),
      Padding(
        padding: context.verticalPaddingNormal,
        child: Text(
          model[id].description ?? '',
          maxLines: 3,
        ),
      )
    ]);
  }

  Column _buildProductTitle(HomeViewModel viewModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          viewModel.products[id].title ?? '',
          style: context.textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: context.verticalPaddingLow,
          child: Text(
            viewModel.products[id].category?.name ?? '',
          ),
        ),
      ],
    );
  }

  Container _buildItemCont(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.05),
      decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: context.normalBorderRadius),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
          Text('0', style: context.textTheme.titleMedium),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

class _ItemImages extends StatelessWidget {
  const _ItemImages({
    Key? key,
    required this.model,
    required this.id,
  }) : super(key: key);

  final int id;
  final List<ProductModel> model;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Images',
        style: context.textTheme.headline6,
        textAlign: TextAlign.left,
      ),
      SizedBox(
        height: context.dynamicHeight(0.1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model[id].images?.length,
          itemBuilder: (context, index) {
            return Observer(builder: (_) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  child: CachedNetworkImage(
                      height: context.dynamicHeight(0.05),
                      imageUrl: model[id].images![index]),
                ),
              );
            });
          },
        ),
      )
    ]);
  }
}
