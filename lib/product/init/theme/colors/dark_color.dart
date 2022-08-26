part of 'color_themes.dart';

class DarkColors implements IColors {
  @override
  final _AppColors colors = _AppColors();

  @override
  late final ColorScheme? colorScheme;
  @override
  late final Color? appBarColor;

  @override
  Color? bottomAppBarColor;

  @override
  late final Color? cardShadowColor;

  @override
  Color? cursorColor;

  @override
  late final Color? scaffoldBackgroundColor;

  @override
  late final Color? tabBarColor;

  @override
  late final Color? tabBarNormalColor;

  @override
  late final Color? tabBarSelectedColor;

  @override
  late final Brightness? brightness;

  @override
  DarkColors() {
    appBarColor = colors.trasnparent;
    scaffoldBackgroundColor = colors.darkGrey;
    tabBarColor = colors.darkerGrey;
    tabBarNormalColor = colors.lighterGrey;
    tabBarSelectedColor = colors.white;
    colorScheme = const ColorScheme.dark()
        .copyWith(onPrimary: colors.white, onSecondary: colors.darkGrey);

    cursorColor = colors.white;
  }

  @override
  Color? textColor;
}
