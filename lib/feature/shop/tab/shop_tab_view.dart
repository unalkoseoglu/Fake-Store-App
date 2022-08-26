import 'package:fake_store/core/init/constants/image_constants.dart';
import 'package:fake_store/feature/shop/tab/model/tab_model.dart';
import 'package:fake_store/product/widget/button/custom_icon_button.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';

class ShopTabView extends StatelessWidget {
  ShopTabView({Key? key}) : super(key: key);
  final _items = TabModels.create().tabItems;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _items.length,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              _categoryButton(context),
              const Spacer(),
              _cirleAvatar(context),
            ],
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: _items.map((e) => e.page).toList()),
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1,
                    blurRadius: 5,
                    color: context.colorScheme.onSurface)
              ],
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: TabBar(
                tabs: _items
                    .map((e) => Tab(text: e.title, icon: Icon(e.icon)))
                    .toList()),
          ),
        ));
  }

  Padding _categoryButton(BuildContext context) {
    return Padding(
      padding: context.onlyLeftPaddingNormal,
      child: CustomIconButton(
        iconSize: 24,
        icon: Icons.filter_list_rounded,
        height: context.dynamicHeight(0.2),
      ),
    );
  }

  Padding _cirleAvatar(BuildContext context) {
    return Padding(
      padding: context.onlyRightPaddingNormal,
      child: FittedBox(
        fit: BoxFit.cover,
        child: CircleAvatar(
            backgroundColor: context.colorScheme.primary,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(1),
              child: Image.asset(
                ImageConstants.instance.avatar,
              ),
            )),
      ),
    );
  }
}
