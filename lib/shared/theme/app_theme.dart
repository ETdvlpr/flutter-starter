import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    fontFamily: 'DM Sans',
    primaryColor: primaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: borderColor1,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: displayLargeBold,
      displayMedium: displayMediumBold,
      displaySmall: displaySmallBold,
      bodyLarge: textLargeRegular,
      bodyMedium: textMediumRegular,
      bodySmall: textSmallRegular,
      labelLarge: textLargeMedium,
      labelMedium: textMediumMedium,
      labelSmall: textSmallMedium,
      titleLarge: textLargeBold,
      titleMedium: textMediumBold,
      titleSmall: textSmallBold,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        textStyle: textMediumMedium,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: textColor2,
      selectionHandleColor: Colors.transparent,
    ),
  );

  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF4CAF50);

  static const Color primaryColor1 = Color(0xFF1E88E5);
  static const Color primaryColor2 = Color(0xFF1976D2);
  static const Color primaryColor3 = Color(0xFF1565C0);
  static const Color primaryColor4 = Color(0xFF0D47A1);

  static const Color secondaryColor1 = Color(0xFF43A047);
  static const Color secondaryColor2 = Color(0xFF388E3C);
  static const Color secondaryColor3 = Color(0xFF2E7D32);

  static const Color textColor1 = Color(0xFF212121);
  static const Color textColor2 = Color(0xff777e90);
  static const Color textColor3 = Color(0xFF757575);
  static const Color textColor4 = Color(0xFF9E9E9E);

  static const Color borderColor1 = Color(0xFFBDBDBD);
  static const Color borderColor2 = Color(0xFFCDDC39);
  static const Color borderColor3 = Color(0xFF009688);
  static const Color borderColor4 = Color(0xFF2196F3);
  static const Color borderColor5 = Color(0xFFFF9800);
  static const Color borderColor6 = Color(0xFFFF5722);

  static const Color backgroundColor1 = Color(0xFFFFFFFF);
  static const Color backgroundColor2 = Color(0xFFF5F5F5);
  static const Color backgroundColor3 = Color(0xFFEEEEEE);
  static const Color backgroundColor4 = Color(0xFFFAFAFA);

  static const Color warningColor = Color(0xffeaac30);
  static const Color greenColor500 = Color(0xff18bb0c);
  static const Color greenColor100 = Color(0xffeaf9de);

  static const List<Color> primaryGradient = <Color>[
    primaryColor,
    secondaryColor,
  ];

  static const TextStyle displayLargeBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static const TextStyle displayLargeMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.18,
  );
  static const TextStyle displayMediumBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.38,
  );
  static const TextStyle displayMediumMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.38,
  );
  static const TextStyle displaySmallBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static const TextStyle displaySmallMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
  static const TextStyle textLargeBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static const TextStyle textLargeMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
  static const TextStyle textLargeRegular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static const TextStyle textMediumBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.38,
  );
  static const TextStyle textMediumMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.38,
  );
  static const TextStyle textMediumRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.38,
  );
  static const TextStyle textSmallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.36,
  );
  static const TextStyle textSmallMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );
  static const TextStyle textSmallRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.36,
  );
}
