import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/presentation/sections/widgets/timeline_container.dart';

import '../../../constants/colors_const.dart';


class TimelineStep extends StatelessWidget {
  final WorkExperience experience;
  final bool reverse;
  final bool isMobile;
  const TimelineStep({super.key, required this.experience, required this.reverse, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          if(!isMobile)
          Expanded(
          child: !reverse ?
          Text('${experience.startDate} - ${experience.endDate}', 
            textAlign: TextAlign.right,
            style: GoogleFonts.poly(
              height: 1,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: ColorsConst.white
            ))
          : TimelineContainer(experience: experience, reverse: true, isMobile: isMobile,)),
          
          Column(
            children: [
              Expanded(
                child: DottedBorder(
                  color: ColorsConst.white,
                  padding: EdgeInsets.zero,
                  dashPattern: const [2, 6],
                  child: const SizedBox.shrink(),
                )
              ),
                
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 16: 30),
                child: const CircleAvatar(
                  radius: 10,
                  backgroundColor: ColorsConst.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: ColorsConst.text,
                  ),
                ),
              ),
            
              Expanded(
                child: DottedBorder(
                  color: ColorsConst.white,
                  padding: EdgeInsets.zero,
                  dashPattern: const [2, 6],
                  child: const SizedBox.shrink(),
                )
              ),
            ],
          ),

          Expanded(
            child: reverse ?
          Text('${experience.startDate} - ${experience.endDate}', 
            textAlign: TextAlign.left,
            style: GoogleFonts.poly(
              height: 1,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: ColorsConst.white
            ))
          : TimelineContainer(experience: experience, reverse: false, isMobile: isMobile))
    
        ],
      ),
    );
  }
}