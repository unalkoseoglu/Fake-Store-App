import 'package:fake_store/feature/shop/home/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key, required this.viewModel}) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(0.9),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.discounts.length,
          itemBuilder: (context, index) {
            return Image.asset(viewModel.discounts[index]);
          },
        ));
  }
}
