import 'package:flutter/material.dart';
import 'package:music_practice/helper/size_config.dart';


class AppStyle{
  AppStyle._();
  static const Color appScaffoldColor  =  Color(0xFFf5d19b);
  static const Color sliderActiveColor =   Color(0xFF183d4d);
  static const Color getStartedButtonColor  =  Color(0xFFde5d4d);
  static const Color sliderThumbColor = Color(0xFFde5d4d);

  static final TextStyle title = TextStyle(
    color: Color(0xFF183d4d),
    fontSize: 3.9 * SizeConfig.textMultiplier!.toDouble(),
    fontWeight: FontWeight.bold
  );

  static final TextStyle subTitle = TextStyle(
    color: Colors.grey,
    fontSize:20,
    height: 1.5,
  );
  static final TextStyle getStarted = TextStyle(
    color: Colors.white,
    fontSize:18,
    letterSpacing: 1.2
  );
  static final TextStyle library = TextStyle(
    color: Color(0xFF183d4d),
    fontSize:30,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1
  );
  static final TextStyle playlist = TextStyle(
    color: Color(0xFF183d4d),
    fontSize:25,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.1
  );
  static final TextStyle playlisttype = TextStyle(
    fontSize:15,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1
  );
  static final TextStyle playlistnum = TextStyle(
    fontSize:12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.1
  );

  static final TextStyle popular = TextStyle(
      color: Color(0xFF183d4d),
      fontSize:25,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.1
  );
  static final TextStyle song = TextStyle(
      color: Color(0xFF183d4d),
      fontSize:15,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.1
  );
  static final TextStyle songbig = TextStyle(
      color: Color(0xFF183d4d),
      fontSize:22,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.1
  );
  static final TextStyle singer = TextStyle(
      color: Colors.blueGrey,
      fontSize:12,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.1
  );
  static final TextStyle singerbig = TextStyle(
      color: Colors.blueGrey,
      fontSize:14,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.1
  );

}