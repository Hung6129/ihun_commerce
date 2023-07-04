import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ihun_commerce/src/common/helpers/palettes.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get appTitle {
    return copyWith(
      fontSize: 25.sp,
      color: Palettes.p1,
    );
  }

  TextStyle get appBarTitle {
    return copyWith(
      fontSize: 22.sp,
      color: Palettes.p1,
    );
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get bold {
    return copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get underLine {
    return copyWith(decoration: TextDecoration.underline);
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get whiteText {
    return copyWith(color: Palettes.textWhite);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
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