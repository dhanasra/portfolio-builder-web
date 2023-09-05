
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';
import 'package:portfolio_builder_ai/presentation/sections/about/about_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/contact/contact_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/education/education_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/footer/footer_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/header/header_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/projects/project_1.dart';
import 'package:portfolio_builder_ai/presentation/sections/skills/skills_1.dart';
import 'package:portfolio_builder_ai/presentation/templates/pages/template_viewmodel.dart';
import 'package:portfolio_builder_ai/widgets/t_button.dart';
import '../../sections/work/work_1.dart';

class TemplateView extends StatefulWidget {
  final ResumeSchema schema;
  const TemplateView({
    super.key,
    required this.schema
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
        automaticallyImplyLeading: false,
        title: Text(widget.schema.basic?.name??'Hi !', 
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
            name: widget.schema.basic?.name,
            designation: 'Flutter developer',
            key: _viewModel.headerKey,
          ),
          if(widget.schema.basic?.summary!=null)
          About1(
            about: widget.schema.basic?.summary??'',
            key: _viewModel.aboutKey,
          ),
          Skills1(
            skills: const ['html', 'Vue', 'Javascript'],
            key: _viewModel.skillKey,
          ),
          Education1(
            key: _viewModel.educationKey,
            education: widget.schema.education??[],
          ),
          Work1(
            key: _viewModel.workKey,
            experiences: widget.schema.workExperience??[],
          ),
          Project1(
            projects: widget.schema.projects??[],
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

