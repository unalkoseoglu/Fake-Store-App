import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../feature/shop/home/model/product_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  CustomSliverAppBar(
      {Key? key,
      required this.index,
      required this.selectedImage,
      required this.model})
      : super(key: key);
  List<ProductModel>? model;
  final int? index;
  final int? selectedImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(25)),
          child: CachedNetworkImage(
            imageUrl: model?[index ?? 0].images?[selectedImage ?? 0] ??
                'Not found image..!',
            height: context.dynamicHeight(0.55),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
