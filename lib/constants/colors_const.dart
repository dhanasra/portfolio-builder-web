
import 'package:flutter/material.dart';

class ColorsConst {

  ColorsConst._();

  static const Color primary = Color(0xFF11BB92);
  static const Color primary1 = Color(0xFF181C52);
  static const Color primary2 = Color(0xFF0C0F40);
  
  static const Color secondary = Color(0xFFFF7F50);

  static const Color tertiary = Color(0xFF04a4fc);
  static const Color tertiary1 = Color(0xFF0273b0);

  static const Color white = Color(0xFFFFFFFF);
  static const Color white1 = Color(0x26FFFFFF);

  static const Color background = Color(0xFFFAFAFF);

  static const Color grey = Color(0xFFdbdbde);
  static const Color grey1 = Color(0xFF565564);

  static const Color shadow = Color(0x40000000);

  static const Color text = Color(0xFF333333);

  static const Color error = Color(0xFFe57373);
  static const Color error1 = Color(0xFFf44336);
  static const Color error2 = Color(0xFFd32f2f);

  static const Color success = Color(0xFF81c784);
  static const Color success1 = Color(0xFF66bb6a);
  static const Color success2 = Color(0xFF388e3c);

  static const Color warning = Color(0xFFffb74d);
  static const Color warning1 = Color(0xFFffa726);
  static const Color warning2 = Color(0xFFf57c00);

  static const Color info = Color(0xFF4fc3f7);
  static const Color info1 = Color(0xFF29b6f6);
  static const Color info2 = Color(0xFF0288d1);


  static Color getTechnologyColor(String technology) {
    
    Map<String, Color> technologyColors = {
        // Programming Languages
        'python': const Color(0xFFFFD43B), // Yellow
        'javascript': const Color(0xFFF7DF1E), // Yelloww
        'js': const Color(0xFFF7DF1E), // Y
        'ruby': const Color(0xFFCC342D), // Ruby Red
        'java': const Color(0xFFED8B00), // Java Red
        'c': const Color(0xFF000000), // Black
        'c++': const Color(0xFF000000), // Black
        'c/c++': const Color(0xFF000000), // Black
        'go': const Color(0xFF00ADD8), // Brown
        'swift': const Color(0xFFFFAC45), // Orange
        'kotlin': const Color(0xFF7F52FF), // Purple
        'rust': const Color(0xFFE57324), // Dark Orange
        'dart': const Color(0xFF00B4AB), // Teal
        'php': const Color(0xFF777BB4), // Blue
        'typescript': const Color(0xFF3178C6), // Blue
        'perl': const Color(0xFF00A0E3), // Blue
        'haskell': const Color(0xFF5E5086), // Purple
        'scala': const Color(0xFFDC322F), // Red
        'elixir': const Color(0xFF6E4A7E), // Purple
        'r': const Color(0xFF276DC3), // Blue
        'julia': const Color(0xFF9558B2), // Purple
        'cobol': const Color(0xFF00427E), // Blue
        'assembly': const Color(0xFF6E4A7E), // Purple
        'lua': const Color(0xFF000080), // Navy
        'objective-c': const Color(0xFFD36D42), // Brown
        'vhdl': const Color(0xFF005BBB), // Blue
        'pl/sql': const Color(0xFFFFD700), // Gold
        'sql': const Color(0xFFFFD700), // Gold

        // Databases
        'mysql': const Color(0xFF00758F), // Blue
        'postgresql': const Color(0xFF32648D), // Blue
        'mongodb': const Color(0xFF4DB33D), // Green
        'sqlite': const Color(0xFF003B57), // Navy
        'redis': const Color(0xFFD82D29), // Red
        'oracle': const Color(0xFFF80000), // Red
        'cassandra': const Color(0xFF1287B6), // Blue

        // Frameworks and Libraries
        'react': const Color(0xFF61DAFB), // Light Blue
        'angular': const Color(0xFFDD0031), // Red
        'vue.js': const Color(0xFF41B883), // Green
        'express.js': const Color(0xFF000000), // Black
        'ruby on rails': const Color(0xFFCC0000), // Red
        'spring boot': const Color(0xFF6DB33F), // Green
        'flutter': const Color(0xFF02569B), // Dark Blue
        'node.js': const Color(0xFF8CC84B), // Green

        // Tools and Platforms
        'github': const Color(0xFF181717), // Black
        'visual studio code' : const Color(0xFF007ACC),
        'vs code' : const Color(0xFF007ACC),
        'docker': const Color(0xFF2496ED), // Blue
        'kubernetes': const Color(0xFF326CE5), // Blue
        'aws': const Color(0xFFF90E08), // Red
        'azure': const Color(0xFF0089D6), // Blue
        'google cloud': const Color(0xFF4285F4), // Blue
        'git': const Color(0xFFF05032), // Orange
        'jenkins': const Color(0xFFD24939), // Red
        'travis ci': const Color(0xFF3EAAAF), // Teal
        'gitlab': const Color(0xFFFC6D26), // Orange (GitLab)
        'bitbucket': const Color(0xFF205081), // Blue (Bitbucket)
        'html': const Color(0xFFE44D26), // Orange (HTML)
        'html5': const Color(0xFFE44D26), // Orange (HTML5)
        'css': const Color(0xFF264DE4), // Blue (CSS)

        // Add more technology-color associations here
      };

    // Convert the technology name to title case to ensure case-insensitive matching
    String formattedTechnology = technology.toLowerCase().trim();
    formattedTechnology = formattedTechnology.split('.')[0];
    // formattedTechnology = formattedTechnology[0].toUpperCase() + formattedTechnology.substring(1);

    // Get the color from the map, or a default color if not found
    return technologyColors[formattedTechnology] ?? Colors.blue; // Default to grey
  }


}

