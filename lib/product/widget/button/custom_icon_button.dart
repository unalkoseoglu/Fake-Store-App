import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    Key? key,
    this.height,
    this.iconSize = 24,
    required this.icon,
    this.onPressed,
    this.buttonColor,
  }) : super(key: key);
  final double? height;
  final double iconSize;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? buttonColor;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.dynamicHeight(widget.height ?? 0),
        decoration:
            const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: widget.buttonColor ?? Colors.white,
            size: widget.iconSize,
          ),
          onPressed: widget.onPressed,
        ));
  }
}
