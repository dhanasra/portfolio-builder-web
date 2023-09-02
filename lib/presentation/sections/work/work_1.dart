import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';

import '../../../network/models/work_experience.dart';
import '../../../responsive/sizing_information.dart';
import '../widgets/timeline_step.dart';

class Work1 extends StatelessWidget {
  final List<WorkExperience> experiences;
  const Work1({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {

    bool isMobileScreen = isMobile(context);
    
    return Container(
          color: const Color(0xFF11234B),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: isMobileScreen? 8: 100, vertical: 60),
                  constraints: BoxConstraints(
                    maxWidth: isMobileScreen ? getWidth(context)-16 : 800
                  ),
                  padding: EdgeInsets.all(isMobileScreen? 8: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
              
                      Text("My Career", 
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poly(
                        fontSize: isMobileScreen ? 24 : 28,
                        fontWeight: FontWeight.w400,
                        color: ColorsConst.white
                      )),
              
                      54.height(),
              
                      ...experiences.asMap().entries.map(
                        (entry) => Column(
                          crossAxisAlignment: isMobileScreen 
                            ? CrossAxisAlignment.start :CrossAxisAlignment.center,
                          children: [
                            TimelineStep(
                              isMobile: isMobileScreen,
                              reverse: isMobileScreen ? false: (entry.key%2)!=0,
                              experience: entry.value,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 26),
                              child: DottedBorder(
                                color: ColorsConst.white,
                                padding: EdgeInsets.zero,
                                dashPattern: const [2, 8],
                                child: const SizedBox(
                                  height: 50,
                                ),
                              ),
                            ),
                          ],
                        )
                      ).toList()
              
                    ]
                  )
                ),
              )
            ]
          )
    );
  }
}