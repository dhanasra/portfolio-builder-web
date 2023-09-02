import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';

import '../../../responsive/sizing_information.dart';

class About1 extends StatelessWidget {
  final String about;
  const About1({super.key, required this.about});

  @override
  Widget build(BuildContext context) {

    bool isMobileScreen = isMobile(context);

    return Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: isMobileScreen? 8: 100, vertical: 60),
                constraints: BoxConstraints(
                  maxWidth: isMobileScreen ? getWidth(context)-16: 600
                ),
                padding: EdgeInsets.all(isMobileScreen? 8: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("ABOUT", 
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poly(
                            fontSize: isMobileScreen ? 24 : 28,
                            fontWeight: FontWeight.w400,
                            color: ColorsConst.white
                          )),
                        ),
                      ],
                    ),
                
                    32.height(),
                
                    Text(about, 
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poly(
                      height: 1.6,
                      fontSize: isMobileScreen ? 16 : 20,
                      fontWeight: FontWeight.w400,
                      color: ColorsConst.white
                    )),
                
                  ]
                )
              )
            ]
          )
    );
  }
}