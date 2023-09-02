import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/responsive/sizing_information.dart';

import '../../shapes/arrow.dart';

class TimelineContainer extends StatelessWidget {
  final WorkExperience experience;
  final bool reverse;
  final bool isMobile;
  const TimelineContainer({
    super.key,
    required this.experience,
    this.isMobile = true,
    this.reverse = false  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: !reverse ? Alignment.centerLeft : Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(!reverse)
          CustomPaint(
            size: const Size(15, 20), 
            painter: Arrow(ColorsConst.white),
          ),
          Container(
            constraints: isMobile 
            ? BoxConstraints(
              minWidth: getWidth(context)-110,
            )
            : const BoxConstraints(
              minWidth: 200,
              maxWidth: 300
            ),
            decoration: BoxDecoration(
              color: ColorsConst.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2), 
                  blurRadius: 4, 
                  offset: Offset(reverse?-3:3, 0)
                )
              ]
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(experience.jobTitle!=null)
                Text(experience.jobTitle!, 
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poly(
                    height: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.text
                  )),
                14.height(),
                if(experience.employer!=null)
                Text(experience.employer!, 
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poly(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.text
                  )),
                14.height(),
                if(experience.startDate!=null && isMobile)
                Text('${experience.startDate} - ${experience.endDate}', 
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poly(
                    height: 1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorsConst.text
                  )),
              ],
            ),
          ),
          if(reverse)
          CustomPaint(
            size: const Size(15, 20), 
            painter: Arrow(ColorsConst.white, reverse: true),
          ),
        ],
      ),
    );
  }
}