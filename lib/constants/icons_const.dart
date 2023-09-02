import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconsConst {

  IconsConst._();

  static IconData? getTechnologyIcon(String technology) {
    
    Map<String, IconData> technologyColors = {
        // Programming Languages
        'python': FontAwesomeIcons.python, // Yellow
        'javascript': FontAwesomeIcons.js, // Yelloww
        'js': FontAwesomeIcons.js, // Y
        'ruby': FontAwesomeIcons.diamond, // Ruby Red
        'java': FontAwesomeIcons.java, // Java Red
        'c': FontAwesomeIcons.c, // Black
        'c++': FontAwesomeIcons.c, // Black
        'c/c++': FontAwesomeIcons.c, // Black
        'go': FontAwesomeIcons.golang, // Brown
        'golang': FontAwesomeIcons.golang, // Brown
        'swift': FontAwesomeIcons.swift, // Orange
        'kotlin': FontAwesomeIcons.k, // Purple
        'rust': FontAwesomeIcons.rust, // Dark Orange
        'dart': FontAwesomeIcons.code, // Teal
        'php': FontAwesomeIcons.php, // Blue
        'typescript': FontAwesomeIcons.js, 
        'scala': FontAwesomeIcons.bars, // Red
        'r': FontAwesomeIcons.r, // Blue
        'pl/sql': FontAwesomeIcons.database, // Gold
        'sql': FontAwesomeIcons.database, // Gold

        // Databases
        'mysql': FontAwesomeIcons.database, // Blue
        'postgresql': FontAwesomeIcons.republican, // Blue
        'mongodb': FontAwesomeIcons.leaf, // Green
        'sqlite': FontAwesomeIcons.database, // Navy
        'redis': FontAwesomeIcons.layerGroup, // Red
        'oracle': FontAwesomeIcons.java, // Red
        'cassandra': FontAwesomeIcons.eye, // Blue

        // Frameworks and Libraries
        'react': FontAwesomeIcons.react, // Light Blue
        'angular': FontAwesomeIcons.angular, // Red
        'vue.js': FontAwesomeIcons.vuejs, // Green
        'vue': FontAwesomeIcons.vuejs, // Green
        'express.js': FontAwesomeIcons.code, // Black
        'ruby on rails': FontAwesomeIcons.code, // Red
        'spring boot': FontAwesomeIcons.powerOff, // Green
        'flutter': FontAwesomeIcons.anglesLeft, // Dark Blue
        'node.js': FontAwesomeIcons.nodeJs, // Green

        // Tools and Platforms
        'github': FontAwesomeIcons.github, // Black
        'visual studio code' : FontAwesomeIcons.code,
        'vs code' : FontAwesomeIcons.code,
        'docker': FontAwesomeIcons.docker, // Blue
        'kubernetes': FontAwesomeIcons.dharmachakra, // Blue
        'aws': FontAwesomeIcons.aws, // Red
        'azure': FontAwesomeIcons.microsoft, // Blue
        'google cloud': FontAwesomeIcons.google, // Blue
        'git': FontAwesomeIcons.git, // Orange
        'jenkins': FontAwesomeIcons.jenkins, // Red
        'travis ci': FontAwesomeIcons.t, // Teal
        'gitlab': FontAwesomeIcons.gitlab, // Orange (GitLab)
        'bitbucket': FontAwesomeIcons.bitbucket, // Blue (Bitbucket)
        'html': FontAwesomeIcons.html5, // Orange (HTML)
        'html5': FontAwesomeIcons.html5, // Orange (HTML5)
        'css': FontAwesomeIcons.css3, // Blue (CSS)

        // Add more technology-color associations here
      };

    // Convert the technology name to title case to ensure case-insensitive matching
    String formattedTechnology = technology.toLowerCase().trim();
    formattedTechnology = formattedTechnology.split('.')[0];

    // formattedTechnology = formattedTechnology[0].toUpperCase() + formattedTechnology.substring(1);

    // Get the color from the map, or a default color if not found
    return technologyColors[formattedTechnology]; // Default to grey
  }


}