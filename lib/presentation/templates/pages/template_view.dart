
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/presentation/sections/about/about_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/contact/contact_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/education/education_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/footer/footer_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/header/header_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/skills/skills_1.dart';
import 'package:portfolio_builder_ai/presentation/templates/pages/template_viewmodel.dart';
import 'package:portfolio_builder_ai/widgets/t_button.dart';

import '../../../network/models/work_experience.dart';
import '../../sections/work/work_1.dart';





class TemplateView extends StatefulWidget {
  const TemplateView({
    super.key,
  });

  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {

  late TemplateViewModel _viewModel;

  @override
  void initState() {
    _viewModel = TemplateViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DHANA SEKARAN', 
          textAlign: TextAlign.center,
          style: GoogleFonts.poly(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white
          )),
        backgroundColor: const Color(0xFF11234B),
        actions: [
          TButton(
            onClick: ()=>_viewModel.scrollToKey(_viewModel.aboutKey), 
            text: 'About', 
            isWhite: true,
            styled: true,
          ),
          16.width(),
          TButton(
            onClick: ()=>_viewModel.scrollToKey(_viewModel.skillKey), 
            text: 'Tech Stack', 
            isWhite: true,
            styled: true,
          ),
          16.width(),
          TButton(
            onClick: ()=>_viewModel.scrollToKey(_viewModel.educationKey), 
            text: 'Education', 
            isWhite: true,
            styled: true,
          ),
          16.width(),
          TButton(
            onClick: ()=>_viewModel.scrollToKey(_viewModel.workKey), 
            text: 'Careers', 
            isWhite: true,
            styled: true,
          ),
          16.width(),
          TButton(
            onClick: ()=>_viewModel.scrollToKey(_viewModel.contactKey), 
            text: 'Contact', 
            isWhite: true,
            styled: true,
          ),
          24.width(),
          IconButton(
            splashRadius: 20,
            onPressed: (){}, 
            iconSize: 16,
            icon: const Icon(FontAwesomeIcons.facebookF)),
          4.width(),
          IconButton(
            splashRadius: 20,
            onPressed: (){}, 
            iconSize: 16,
            icon: const Icon(FontAwesomeIcons.github)),
          4.width(),
          IconButton(
            splashRadius: 20,
            onPressed: (){}, 
            iconSize: 16,
            icon: const Icon(FontAwesomeIcons.linkedinIn)),
          16.width(),
        ],
      ),
      body: ListView(
        controller: _viewModel.controller,
        children: [

          Header1(
            key: _viewModel.headerKey,
          ),
          About1(
            key: _viewModel.aboutKey,
          ),
          Skills1(
            key: _viewModel.skillKey,
          ),
          Education1(
            key: _viewModel.educationKey,
            education: const [
              Education(
                institution: 'KLN College of Engineering', 
                degree: 'ECE', 
                major: 'Communication', 
                graduationDate: '2021'
              ),
              Education(
                institution: "St mary's Hr Sec School", 
                degree: '12th', 
                major: 'Bio Maths', 
                graduationDate: '2018'
              ),
              Education(
                institution: "St mary's Hr Sec School", 
                degree: '10th', 
                major: '', 
                graduationDate: '2016'
              )
            ],
          ),
          Work1(
            key: _viewModel.workKey,
            experiences: const [
              WorkExperience(
                jobTitle: 'Flutter Developer',
                employer: 'Vaken Technologies Pvt. Ltd',
                startDate: 'May 2021',
                endDate: 'June 2022'
              ),
              WorkExperience(
                jobTitle: 'Flutter Developer',
                employer: 'Vaken Technologies Pvt. Ltd',
                startDate: 'May 2021',
                endDate: 'June 2022'
              ),
              WorkExperience(
                jobTitle: 'Flutter Developer',
                employer: 'Vaken Technologies Pvt. Ltd',
                startDate: 'May 2021',
                endDate: 'June 2022'
              ),
              WorkExperience(
                jobTitle: 'Flutter Developer',
                employer: 'Vaken Technologies Pvt. Ltd',
                startDate: 'May 2021',
                endDate: 'June 2022'
              )
            ],
          ),
          Contact1(
            key: _viewModel.contactKey,
          ),
          const Footer1()

        ],
      ),
    );
  }
}

