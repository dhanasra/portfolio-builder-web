import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/widgets/input_field.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';

import '../../../constants/colors_const.dart';
import '../../../responsive/sizing_information.dart';

class Contact1 extends StatelessWidget {
  const Contact1({super.key});

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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Text("Contact", 
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

                    InputField(
                      defaultMargin: true,
                      hintText: 'Your Name',
                      controller: TextEditingController()),
                    
                    InputField(
                      defaultMargin: true,
                      hintText: 'Your Email',
                      controller: TextEditingController()),

                    InputField(
                      defaultMargin: true,
                      maxLines: 10,
                      hintText: 'Your Message',
                      controller: TextEditingController()),
                
                    32.height(),
                
                    OButton(
                      isWhite: true,
                      onClick: (){}, 
                      text: 'SEND'
                    )
                
                  ]
                )
              )
            ]
          )
    );
  }
}