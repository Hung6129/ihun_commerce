import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ihun_commerce/config/palettes.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get appTitle => copyWith(fontSize: 25.sp, color: Palettes.p1);

  TextStyle get appBarTitle => copyWith(fontSize: 22.sp, color: Palettes.p1);

  TextStyle get italic =>
      copyWith(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get underLine => copyWith(decoration: TextDecoration.underline);

  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get whiteText => copyWith(color: Palettes.textWhite);

  TextStyle get mediumText =>
      copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600);

  TextStyle get smallText =>
      copyWith(fontSize: 12.sp, fontWeight: FontWeight.w300);

  // convenience functions
  TextStyle setColor(Color color) => copyWith(color: color);

  TextStyle setTextSize(double size) => copyWith(fontSize: size);
}

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static TextStyle defaultStyle = GoogleFonts.poppins(
    color: Palettes.textBlack,
    letterSpacing: 0.75,
  );
  static TextStyle customStyle = GoogleFonts.montserrat(
    color: Palettes.textBlack,
    letterSpacing: 0.75,
  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);