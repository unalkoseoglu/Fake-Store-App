part of 'color_themes.dart';

class LightColors implements IColors {
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
  LightColors() {
    cardShadowColor = colors.athensGray;
    appBarColor = colors.trasnparent;
    textColor = colors.black;
    scaffoldBackgroundColor = colors.white;
    tabBarColor = colors.darkerGrey;
    tabBarNormalColor = colors.black;
    tabBarSelectedColor = colors.black;
    colorScheme = ColorScheme(
        onPrimary: colors.darkGrey,
        onSecondary: colors.black,
        onError: Colors.red,
        primary: colors.lightGrey,
        secondary: colors.mediumGrey,
        surface: colors.white,
        error: Colors.red,
        onSurface: colors.mediumGreyBold,
        onBackground: colors.darkGrey,
        background: colors.lightGrey,
        brightness: Brightness.light);
  }

  @override
  Color? textColor;
}
