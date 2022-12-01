import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

// colors
const Color kSoftBlack = Color(0xFF181818);
const Color kSoftWhite = Color(0xFFF8F8F8);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kPrussianBlue = Color(0xFF003566);
const Color kBrightBlue = Color(0xff012fd2);

// text style
final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 23,
  fontWeight: FontWeight.w400,
  color: kSoftBlack,
);
final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
  color: kSoftBlack,
);
final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
  color: kSoftBlack,
);
final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
  color: kSoftBlack,
);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kBrightBlue,
  primaryContainer: kBrightBlue,
  secondary: kPrussianBlue,
  secondaryContainer: kPrussianBlue,
  surface: kSoftBlack,
  background: kSoftBlack,
  error: Colors.red,
  onPrimary: kSoftBlack,
  onSecondary: kSoftBlack,
  onSurface: kSoftBlack,
  onBackground: kSoftBlack,
  onError: kSoftWhite,
  brightness: Brightness.light,
);
