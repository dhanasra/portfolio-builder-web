import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';

import '../../../constants/colors_const.dart';
import '../../../responsive/sizing_information.dart';

class Education1 extends StatelessWidget {
  final List<Education> education;
  const Education1({
    super.key,
    required this.education  
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: isMobileScreen? 8: 30, vertical: 60),
                constraints: BoxConstraints(
                   maxWidth: isMobileScreen ? getWidth(context)-16: 900
                ),
                padding: EdgeInsets.all(isMobileScreen? 8: 24),

                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("My Education", 
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poly(
                          fontSize: isMobileScreen ? 24 : 28,
                          fontWeight: FontWeight.w400,
                          color: ColorsConst.white
                        )),
                      ],
                    ),
                
                    64.height(),
              

                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobileScreen ? 1: 3,
                        childAspectRatio: isMobileScreen ? 2: 1.8
                      ), 
                      itemCount: education.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index){
                        var e = education[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Column(
                            children: [
                              Text('${e.area} (${e.studyType})', 
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poly(
                                height: 1.6,
                                fontSize: isMobileScreen ? 20 : 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              )),
                        
                              Text(e.institution??"", 
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poly(
                                height: 1.6,
                                fontSize: isMobileScreen ? 14 : 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              )),
                        
                              Text("${e.startDate} - ${e.endDate}", 
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poly(
                                height: 1.6,
                                fontSize: isMobileScreen ? 14 : 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              )),
                        
                            ],
                          ),
                        );
                      })
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}