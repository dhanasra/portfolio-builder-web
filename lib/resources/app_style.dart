import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors_const.dart';

class AppStyle {


  static ThemeData getApplicationTheme(String theme){

    Color textColor = ColorsConst.text;

    if(theme=='dark'){
      textColor = ColorsConst.white;
    }


    return (theme =='light'?ThemeData.light():ThemeData.dark()).copyWith(

      primaryColor: ColorsConst.primary,
      dividerColor: ColorsConst.grey,
      shadowColor: ColorsConst.shadow,
      scaffoldBackgroundColor: ColorsConst.white,

      tabBarTheme: TabBarTheme(
        labelStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: ColorsConst.white
        ),
        unselectedLabelStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),
      ),

      colorScheme: const ColorScheme.light(
        primary: ColorsConst.primary,
        secondary: ColorsConst.primary
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16)
          )
        ),
      ),

      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: ColorsConst.white,
        elevation: 2,
        titleTextStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: ColorsConst.white
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorsConst.primary,
        selectedItemColor: ColorsConst.primary,
        unselectedItemColor: ColorsConst.grey,
        showUnselectedLabels: true
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              height: 1,
              color: ColorsConst.primary
            ),
          side: const BorderSide(color: ColorsConst.primary, width: 1),
        )
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 18)),
          backgroundColor: const MaterialStatePropertyAll(ColorsConst.primary),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              height: 1,
              color: ColorsConst.white
            )
          )
        )
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsConst.primary,
        foregroundColor: ColorsConst.white,
        extendedTextStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          height: 1
        )
      ),

      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.lato(
            color: ColorsConst.grey1
          ),
          hintStyle: GoogleFonts.lato(
            color: ColorsConst.grey1
          ),
          floatingLabelStyle: GoogleFonts.lato(
            color: ColorsConst.primary
          ),
        )
      ),

      chipTheme: ChipThemeData(
        side: const BorderSide(
          color: ColorsConst.primary
        ),
        labelStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: ColorsConst.primary
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(ColorsConst.primary),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1,
            )
          )
        )
      ),

      dialogTheme: DialogTheme(
        titleTextStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor
        ),
        contentTextStyle: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: textColor
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16)
      ),

      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: ColorsConst.primary
          )
        ),
        errorStyle: GoogleFonts.lato(
          color: ColorsConst.error,
          fontSize: 12
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: ColorsConst.grey
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: ColorsConst.error1
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: ColorsConst.primary
          )
        ),
        labelStyle: GoogleFonts.lato(
          color: ColorsConst.grey1
        ),
        hintStyle: GoogleFonts.lato(
          color: ColorsConst.grey1
        ),
        floatingLabelStyle: GoogleFonts.lato(
          color: ColorsConst.primary
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w900,
          fontSize: 70
        ),
        headlineMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
          fontSize: 30
        ),
        headlineSmall: GoogleFonts.openSans(
          fontWeight: FontWeight.w700,
          fontSize: 26
        ),
        titleLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          fontSize: 30
        ),
        titleMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: textColor
        ),
        titleSmall: GoogleFonts.lato(
          
        ),
        bodyLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: textColor
        ),
        bodyMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor
        ),
        bodySmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: textColor
        ),
        labelLarge: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: textColor
        ),
        labelMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: textColor
        ),
        labelSmall: GoogleFonts.lato(
          
        )
      )

    );
  }

}