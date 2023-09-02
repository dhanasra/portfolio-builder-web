import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors_const.dart';

class Footer1 extends StatelessWidget {
  const Footer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Made With Careers Craft AI", 
            textAlign: TextAlign.center,
            style: GoogleFonts.poly(
              height: 1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorsConst.white
            )),
        ],
      ),
    );
  }
}