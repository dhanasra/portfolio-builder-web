import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/constants/icons_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';

import '../../../constants/colors_const.dart';
import '../../../responsive/sizing_information.dart';

class Skills1 extends StatelessWidget {
  const Skills1({super.key});

  @override
  Widget build(BuildContext context) {

    bool isMobileScreen = isMobile(context);

    var skills = ['Html', 'Css', 'javascript', 'Flutter','Vue', 'React'];

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
                          child: Text("My Tech Stack", 
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poly(
                            fontSize: isMobileScreen ? 24 : 28,
                            fontWeight: FontWeight.w400,
                            color: ColorsConst.white
                          )),
                        ),
                      ],
                    ),
                    16.height(),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: skills.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                      ), 
                      itemBuilder: (_, index){
                        IconData? icon =  IconsConst.getTechnologyIcon(skills[index]);
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Icon(
                                icon, 
                                size: isMobileScreen ? 24: 54,
                                color: ColorsConst.getTechnologyColor(skills[index])
                              ),
                              16.height(),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(skills[index], 
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poly(
                                    fontSize: isMobileScreen ? 16 : 22,
                                    fontWeight: FontWeight.w400,
                                    color: ColorsConst.getTechnologyColor(skills[index])
                                  )
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    
                    // const Icon(FontAwesomeIcons.html5),
                    // const Icon(FontAwesomeIcons.java),
                    // const Icon(FontAwesomeIcons.js),
                    // const Icon(FontAwesomeIcons.react),
                    // const Icon(FontAwesomeIcons.vuejs),
                    // const Icon(FontAwesomeIcons.sass),
                    // const Icon(FontAwesomeIcons.github),
                  ]
                )
              ),
            ]
          )
    );
  }
}