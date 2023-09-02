import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';

import '../../../constants/colors_const.dart';
import '../../../responsive/sizing_information.dart';
import '../../../widgets/t_button.dart';

class Project1 extends StatelessWidget {
  final List<Project> projects;
  const Project1({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {

    bool isMobileScreen = isMobile(context);

    return Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                            
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 60),
                constraints: BoxConstraints(
                  maxWidth: isMobileScreen ? getWidth(context)-16: 780
                ),
                padding: EdgeInsets.all(isMobileScreen? 8: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                                     
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("My Projects", 
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

                    ...projects.asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: (e.key%2)==0 ? Alignment.centerLeft: Alignment.centerRight,
                              child: Text(e.value.name??'', 
                              textAlign: (e.key%2)==0 ? TextAlign.left: TextAlign.right,
                              style: GoogleFonts.poly(
                                fontSize: isMobileScreen ? 20 : 24,
                                fontWeight: FontWeight.w400,
                                color: ColorsConst.white
                              )),
                            ),
                            8.height(),
                            Align(
                              alignment: (e.key%2)==0 ? Alignment.centerLeft: Alignment.centerRight,
                              child: Text(e.value.description??'', 
                              textAlign: (e.key%2)==0 ? TextAlign.left: TextAlign.right,
                              style: GoogleFonts.poly(
                                height: 1.6,
                                fontSize: isMobileScreen ? 14 : 16,
                                fontWeight: FontWeight.w400,
                                color: ColorsConst.white
                              )),
                            ),
                            16.height(),
                            Align(
                              alignment: (e.key%2)==0 ? Alignment.centerLeft: Alignment.centerRight,
                              child: Wrap(
                                alignment: (e.key%2)==0 ? WrapAlignment.start: WrapAlignment.end,
                                    children: (e.value.technologiesUsed??[]).map(
                                    (tech) => Padding(
                                      padding: EdgeInsets.only(
                                        right: (e.key%2)==0 ? 16: 0 , left: (e.key%2)==0 ?0 :16, bottom: 16,),
                                      child: Chip(
                                        label: Text(tech, style: GoogleFonts.poly(
                                          height: 1,
                                          fontSize: isMobileScreen ? 10 : 14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsConst.white
                                        )),
                                        backgroundColor: ColorsConst.text,  
                                      ),
                                    )
                                    ).toList(),
                                  ),
                            ),
                            Align(
                              alignment: (e.key%2)==0 ? Alignment.centerLeft: Alignment.centerRight,
                              child: TButton(onClick: (){}, text: 'View')),

                            const Divider()
                          ],
                        ),
                      )
                    ).toList()

                  ],
                )
              )
            ]
          )
    );
  }
}