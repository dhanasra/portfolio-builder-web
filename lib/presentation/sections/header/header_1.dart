import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/responsive/sizing_information.dart';

import '../../../responsive/responsive_row.dart';
import '../../../widgets/o_button.dart';



class Header1 extends StatelessWidget {
  final String? name;
  final String? designation;
  final String? image;
  const Header1({
    super.key,
    this.name,
    this.designation,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints constraints) {

        bool isMobileScreen = isMobile(context);

        return Container(
          color: const Color(0xFF11234B),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: isMobileScreen? 8: 100, vertical: 180),
                  constraints: const BoxConstraints(
                    maxWidth: 1200
                  ),
                  padding: EdgeInsets.all(isMobileScreen? 8: 24),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('DHANA SEKARAN', 
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poly(
                        fontSize: isMobileScreen ? 32 : 64,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      )),
                      Container(
                        height: isMobileScreen ? 4: 8,
                        width: isMobileScreen? 100: 200,
                        margin: const EdgeInsets.only(top: 8, bottom: 16),
                        color: Colors.white,
                      ),
                      Text("I am a Flutter Developer", 
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poly(
                        fontSize: isMobileScreen ? 24 : 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      )),
                      64.height(),
                      ResponsiveRow(
                        rowMainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: isMobileScreen ? 240 : 160,
                            height: isMobileScreen ? 40: 50,
                            child: OButton(
                              isWhite: true,
                              onClick: (){}, 
                              text: 'Contact Me'
                            )),
                          isMobileScreen ? 24.height() : 24.width(),
                          SizedBox(
                            width: isMobileScreen ? 240 : 160,
                            height: isMobileScreen ? 40: 50,
                            child: OButton(
                              isWhite: true,
                              onClick: (){}, 
                              text: 'My Resume'
                            ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}