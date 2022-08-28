import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constant {
  ///////////////////COLORS///////////////////////

  static Color background = const Color(0xFF292D32);
  static Color background2 = const Color(0xff3d4045);
  static Color textColor = const Color(0xffE7F6F2);
  static Color lightBlue = const Color(0xffA5C9CA);
  static Color darkBlue = const Color(0xff395B64);

  static BoxDecoration containerDecoration() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.1),
        offset: const Offset(-6.0, -6.0),
        blurRadius: 10.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        offset: const Offset(6.0, 6.0),
        blurRadius: 10.0,
      ),
    ], borderRadius: BorderRadius.circular(25), color: Constant.background);
  }
}
