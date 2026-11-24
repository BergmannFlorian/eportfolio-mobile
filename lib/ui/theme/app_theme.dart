import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

/// Design tokens from the website (see CLAUDE.md, "Visual identity").
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.bg,
    required this.surface,
    required this.fg,
    required this.fgStrong,
    required this.fgMuted,
    required this.fgSubtle,
    required this.border,
    required this.borderStrong,
    required this.chipBorder,
    required this.inverse,
    required this.inverseFg,
    required this.inverseSubtle,
    required this.accent,
    required this.accentFg,
  });

  static const light = AppColors(
    bg: Color(0xFFF7F6F3),
    surface: Color(0xFFFFFFFF),
    fg: Color(0xFF141414),
    fgStrong: Color(0xFF141414),
    fgMuted: Color(0xFF3A3A3A),
    fgSubtle: Color(0xFF5C5C5C),
    border: Color(0xFFDEDCD6),
    borderStrong: Color(0xFF141414),
    chipBorder: Color(0xFFC9C6BE),
    inverse: Color(0xFF141414),
    inverseFg: Color(0xFFF7F6F3),
    inverseSubtle: Color(0xFFBDBDBD),
    accent: Color(0xFFB5512E),
    accentFg: Color(0xFFFFFFFF),
  );

  static const dark = AppColors(
    bg: Color(0xFF111111),
    surface: Color(0xFF1A1A1A),
    fg: Color(0xFFEDEBE6),
    fgStrong: Color(0xFFFFFFFF),
    fgMuted: Color(0xFFC9C6BF),
    fgSubtle: Color(0xFFA3A09A),
    border: Color(0xFF2A2A2A),
    borderStrong: Color(0xFFEDEBE6),
    chipBorder: Color(0xFF3A3A3A),
    inverse: Color(0xFFEDEBE6),
    inverseFg: Color(0xFF111111),
    inverseSubtle: Color(0xFF5C5A55),
    accent: Color(0xFFE8875F),
    accentFg: Color(0xFF111111),
  );

  final Color bg;
  final Color surface;
  final Color fg;
  final Color fgStrong;
  final Color fgMuted;
  final Color fgSubtle;
  final Color border;
  final Color borderStrong;
  final Color chipBorder;
  final Color inverse;
  final Color inverseFg;
  final Color inverseSubtle;
  final Color accent;
  final Color accentFg;

  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      bg: l(bg, other.bg),
      surface: l(surface, other.surface),
      fg: l(fg, other.fg),
      fgStrong: l(fgStrong, other.fgStrong),
      fgMuted: l(fgMuted, other.fgMuted),
      fgSubtle: l(fgSubtle, other.fgSubtle),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      chipBorder: l(chipBorder, other.chipBorder),
      inverse: l(inverse, other.inverse),
      inverseFg: l(inverseFg, other.inverseFg),
      inverseSubtle: l(inverseSubtle, other.inverseSubtle),
      accent: l(accent, other.accent),
      accentFg: l(accentFg, other.accentFg),
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

/// Font families bundled in `assets/fonts` (see pubspec.yaml).
abstract final class AppFonts {
  static const heading = 'Questrial';
  static const body = 'Inter';
  static const mono = 'JetBrainsMono';
}

/// Text styles of the design. Colors are passed explicitly so the same style
/// works on normal and inverse surfaces.
abstract final class AppText {
  static TextStyle display(Color color, {double size = 34}) => TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: size,
    height: 1.08,
    letterSpacing: -0.025 * size,
    color: color,
  );

  static TextStyle heading(Color color, {double size = 19}) => TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: size,
    height: 1.18,
    letterSpacing: -0.01 * size,
    color: color,
  );

  static TextStyle body(Color color, {double size = 15, FontWeight? weight}) =>
      TextStyle(
        fontFamily: AppFonts.body,
        fontSize: size,
        height: 1.5,
        fontWeight: weight,
        color: color,
      );

  static TextStyle mono(
    Color color, {
    double size = 12,
    FontWeight weight = FontWeight.w400,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: AppFonts.mono,
    fontSize: size,
    height: 1.4,
    fontWeight: weight,
    letterSpacing: letterSpacing,
    color: color,
  );

  /// Small-caps mono label, e.g. `// PROJECTS`. Upper-case the text yourself.
  static TextStyle kicker(Color color) => mono(
    color,
    size: 11,
    weight: FontWeight.w500,
    letterSpacing: 1.1,
  );
}

abstract final class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);

  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: c.accent,
        onPrimary: c.accentFg,
        secondary: c.accent,
        onSecondary: c.accentFg,
        error: c.accent,
        onError: c.accentFg,
        surface: c.bg,
        onSurface: c.fg,
      ),
      scaffoldBackgroundColor: c.bg,
      canvasColor: c.bg,
      fontFamily: AppFonts.body,
      dividerColor: c.border,
      // No ripples or tints: pressed states are drawn explicitly.
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: c.accent.withValues(alpha: 0.2),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.accent,
        selectionColor: c.accent.withValues(alpha: 0.3),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.accent),
      extensions: [c],
    );
  }

  /// Status and navigation bar style matching [brightness].
  static SystemUiOverlayStyle overlayStyle(Brightness brightness, Color bg) {
    final dark = brightness == Brightness.dark;
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
      statusBarBrightness: brightness,
      systemNavigationBarColor: bg,
      systemNavigationBarIconBrightness:
          dark ? Brightness.light : Brightness.dark,
    );
  }
}
