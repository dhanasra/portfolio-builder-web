import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';
import 'package:portfolio_builder_ai/presentation/editor/cubits/schema_cubit.dart';
import 'package:portfolio_builder_ai/presentation/forms/awards_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/basics_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/certificates_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/education_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/languages_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/project_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/publication_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/reference_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/skills_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/work_form.dart';
import 'package:portfolio_builder_ai/widgets/custom_drawer.dart';

import '../../../../network/models/resume.dart';

class TemplateEditorViewModel extends BaseViewModel {

  final BuildContext context;
  final Resume? resume;
  TemplateEditorViewModel(this.context,{required this.resume});

  late ValueNotifier<String?> selectedItem;
  late ResumeSchema resumeSchema;

  late ValueNotifier<bool> hideSideNav;
  late GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initialize() {
    selectedItem = ValueNotifier(null);
    resumeSchema = resume?.schema??const ResumeSchema();

    hideSideNav = ValueNotifier(false);
    scaffoldKey = GlobalKey();
  }

  openDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }

  closeDrawer(){
    scaffoldKey.currentState!.closeEndDrawer();
    selectedItem.value = '';
  }

  getDrawerWidget(String selectedItem){
    return CustomDrawer(
      header: 'Enter $selectedItem details',
      onClose: ()=>closeDrawer(),
      child: selectedItem=='basics'
        ? BasicsForm(
          basic: resumeSchema.basic, 
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              basic: updated
            );
            updateResumeSchema();
          })
        : selectedItem=='work'
        ? WorkForm(
          experience: resumeSchema.workExperience,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              workExperience: updated
            );
            updateResumeSchema();
          },
        )
        : selectedItem=='education'
        ? EducationForm(
          education: resumeSchema.education,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              education: updated
            );
            updateResumeSchema();
          },
        ) 
        : selectedItem=='projects'
        ? ProjectForm(
          projects: resumeSchema.projects,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              projects: updated
            );
            updateResumeSchema();
          },
        )
        : selectedItem=='publications'
        ? PublicationForm(
          publication: resumeSchema.publications,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              publications: updated
            );
            updateResumeSchema();
          },
        )
        : selectedItem=='references'
        ? ReferenceForm(
          reference: resumeSchema.references,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              references: updated
            );
            updateResumeSchema();
          },
        )
        : selectedItem=='awards'
        ? AwardsForm(
          award: resumeSchema.awards,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              awards: updated
            );
            updateResumeSchema();
          },
        )
        : selectedItem=='certificates'
        ? CertificatesForm(
          certificate: resumeSchema.certificates,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              certificates: updated
            );
            updateResumeSchema();
          },
        ) 
        : selectedItem=='skills'
        ? SkillsForm(
          skills: resumeSchema.skills,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              skills: updated
            );
            updateResumeSchema();
          },
        )
        : selectedItem=='languages'
        ? LanguagesForm(
          languages: resumeSchema.languages,
          onChanged: (updated){
            resumeSchema = resumeSchema.copyWith(
              languages: updated
            );
            updateResumeSchema();
          },
        ) : Container(),
      );
    }
  
  updateResumeSchema(){
    closeDrawer();
    context.read<SchemaCubit>().update(resumeSchema);
  }


  @override
  void dispose() {

  }


}