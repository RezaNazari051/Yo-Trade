import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yo_trade/config/responsive.dart';
import 'package:yo_trade/config/theme/app_color.dart';

class AppTheme {
   

   static ThemeData darkTheme=ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackgroundColor,
    canvasColor: darkSurfaceColor,
    colorScheme: const ColorScheme.dark(
      // onPrimary: ,
      background: Colors.red,
      primary: primaryColor,
      secondary: darkSecondaryColor,
      surface: darkSurfaceColor,
      outline: Color(0xff3D455C),
      onPrimary: Colors.white
    ),
    // primaryColor: const Color(0xff22283a),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle:  GoogleFonts.readexPro(
        fontSize:Responsive.isMobile()?12.sp:14.sp,
        color:primaryColor
      ),
    ),
    // scaffoldBackgroundColor: darkBackgroundColor,
    textTheme: TextTheme(
      
      bodySmall: GoogleFonts.readexPro(
        fontSize:Responsive.isMobile()?14.sp:16.sp
      ),
      bodyMedium: GoogleFonts.readexPro(
        fontSize: Responsive.isMobile()?16.sp:18.sp
      ),
      titleLarge: GoogleFonts.readexPro(
        fontSize:Responsive.isMobile()?30.sp:16.sp
      ),
      headlineSmall: GoogleFonts.readexPro(
        fontSize:Responsive.isMobile()?10.sp:12.sp
      ),
      
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
    )

    ,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor
    )
   );

   
}