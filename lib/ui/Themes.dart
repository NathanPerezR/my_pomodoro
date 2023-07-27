import 'package:flutter/material.dart';

class CommonThemes {

  ThemeData defaultTheme = ThemeData(

    scaffoldBackgroundColor: Colors.white, // background color, must be same as onBackground

    colorScheme: const ColorScheme(
      brightness: Brightness.light,           
      primary: Colors.black,               // selected div in add task screen, and button colors in dialog
      onPrimary: Colors.white,             // hamburger menu
      secondary: Colors.red,               // n/a
      onSecondary: Colors.white,           // color of dividers on cards 
      tertiary: Colors.black,              // timer color, and the color of isBreak text
      onTertiary: Colors.black,            // timer circle that moves
      error: Colors.red,
      onError: Colors.black,
      background: Colors.grey,             // drawerheader
      onBackground: Colors.white,          // inner circle (gives illusion of transparant in defaultTheme)
      surface: Colors.black,               // cards
      onSurface: Colors.black,             // underline in add task screen        
      onSurfaceVariant: Colors.white,      // unused so far, but might prove useful    
    )
  );

  ThemeData inverseOfDefaultTheme = ThemeData(

    scaffoldBackgroundColor: Colors.white, // background color, must be same as onBackground

    colorScheme: const ColorScheme(
      brightness: Brightness.light,           
      primary: Colors.black,               // selected div in add task screen, and button colors in dialog
      onPrimary: Colors.white,             // hamburger menu
      secondary: Colors.red,               // n/a
      onSecondary: Colors.white,           // color of dividers on cards 
      tertiary: Colors.black,              // timer color, and the color of isBreak text
      onTertiary: Colors.black,            // timer circle that moves
      error: Colors.red,
      onError: Colors.black,
      background: Colors.grey,             // drawerheader
      onBackground: Colors.white,          // inner circle (gives illusion of transparant in defaultTheme)
      surface: Colors.black,               // cards
      onSurface: Colors.black,             // underline in add task screen        
      onSurfaceVariant: Colors.white,      // unused so far, but might prove useful    
    )
  );
}