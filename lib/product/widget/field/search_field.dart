import 'package:easy_localization/easy_localization.dart';
import 'package:fake_store/product/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: context.colorScheme.primary,
          filled: true,
          isDense: true,
          prefixIcon: const Icon(Icons.search, size: 24),
          labelText: LocaleKeys.home_search.tr(),
          labelStyle: context.textTheme.subtitle1,
          border: OutlineInputBorder(
              borderRadius: context.highBorderRadius,
              borderSide: BorderSide.none)),
    );
  }
}
