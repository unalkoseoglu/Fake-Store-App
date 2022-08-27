import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/feature/shop/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key, required this.items, required this.index, required this.onTap})
      : super(key: key);
  final List<ProductModel> items;
  final int index;
  final void Function() onTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: ClipRRect(
        borderRadius: context.normalBorderRadius,
        child: CachedNetworkImage(
          imageUrl: widget.items[widget.index].images?[0] ?? '',
          height: context.dynamicHeight(0.2),
          fit: BoxFit.cover,
        ),
      ),
      subtitle: Column(
        children: [
          Padding(
            padding: context.verticalPaddingLow,
            child: _textCustom(
                items: widget.items,
                text: '${widget.items[widget.index].title}'),
          ),
          _textCustom(
              items: widget.items,
              text: '\$${widget.items[widget.index].price}.00')
        ],
      ),
    );
  }
}

class _textCustom extends StatelessWidget {
  const _textCustom({
    Key? key,
    required this.items,
    required this.text,
  }) : super(key: key);

  final List<ProductModel> items;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.center,
      style:
          context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
