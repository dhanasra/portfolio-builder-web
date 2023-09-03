import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';
import 'package:portfolio_builder_ai/network/models/award.dart';
import 'package:portfolio_builder_ai/network/models/basic.dart';
import 'package:portfolio_builder_ai/network/models/certificate.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';
import 'package:portfolio_builder_ai/network/models/publication.dart';
import 'package:portfolio_builder_ai/network/models/reference.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/presentation/forms/awards_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/basics_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/certificates_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/education_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/project_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/publication_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/reference_form.dart';
import 'package:portfolio_builder_ai/presentation/forms/work_form.dart';
import 'package:portfolio_builder_ai/widgets/custom_drawer.dart';

class TemplateEditorViewModel extends BaseViewModel {

  final BuildContext context;
  final ResumeSchema schema;
  TemplateEditorViewModel(this.context,{required this.schema});

  late ValueNotifier<String?> selectedItem;
  late ValueNotifier<ResumeSchema> resume;
  late ValueNotifier<bool> hideSideNav;
  late GlobalKey<ScaffoldState> scaffoldKey;

  late ValueNotifier<Basic> basic;
  late ValueNotifier<List<WorkExperience>> work;
  late ValueNotifier<List<Education>> education;
  late ValueNotifier<List<Project>> projects;
  late ValueNotifier<List<Award>> awards;
  late ValueNotifier<List<Certificate>> certificates;
  late ValueNotifier<List<Publication>> publications;
  late ValueNotifier<List<Reference>> references;

  @override
  void initialize() {
    selectedItem = ValueNotifier(null);
    resume = ValueNotifier(schema);
    hideSideNav = ValueNotifier(false);
    scaffoldKey = GlobalKey();

    basic = ValueNotifier(const Basic());
    work = ValueNotifier([]);
    education = ValueNotifier([]);
    projects = ValueNotifier([]);
    awards = ValueNotifier([]);
    certificates = ValueNotifier([]);
    publications = ValueNotifier([]);
    references = ValueNotifier([]);
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
        ? ValueListenableBuilder(
          valueListenable: basic,
          builder: (_, value, __) {
            return BasicsForm(
              basic: value, 
              onChanged: (updated){
                basic.value = updated;
                closeDrawer();
              });
          }
        )
        : selectedItem=='work'
        ? ValueListenableBuilder(
          valueListenable: work,
          builder: (_, value, __) {
            return WorkForm(
              experience: value,
              onChanged: (updated){
                work.value = updated;
                closeDrawer();
              },
            );
          }
        )
        : selectedItem=='education'
        ? ValueListenableBuilder(
          valueListenable: education,
          builder: (_, value, __) {
            return EducationForm(
              education: value,
              onChanged: (updated){
                education.value = updated;
                closeDrawer();
              },
            );
          }
        ) 
        : selectedItem=='projects'
        ? ValueListenableBuilder(
          valueListenable: projects,
          builder: (_, value, __) {
            return ProjectForm(
              projects: value,
              onChanged: (updated){
                projects.value = updated;
                closeDrawer();
              },
            );
          }
        )
        : selectedItem=='publications'
        ? ValueListenableBuilder(
          valueListenable: publications,
          builder: (_, value, __) {
            return PublicationForm(
              publication: value,
              onChanged: (updated){
                publications.value = updated;
                closeDrawer();
              },
            );
          }
        )
        : selectedItem=='references'
        ? ValueListenableBuilder(
          valueListenable: references,
          builder: (_, value, __) {
            return ReferenceForm(
              reference: value,
              onChanged: (updated){
                references.value = updated;
                closeDrawer();
              },
            );
          }
        )
        : selectedItem=='awards'
        ? ValueListenableBuilder(
          valueListenable: awards,
          builder: (_, value, __) {
            return AwardsForm(
              award: value,
              onChanged: (updated){
                awards.value = updated;
                closeDrawer();
              },
            );
          }
        )
        : selectedItem=='certificates'
        ? ValueListenableBuilder(
          valueListenable: certificates,
          builder: (_, value, __) {
            return CertificatesForm(
              certificate: value,
              onChanged: (updated){
                certificates.value = updated;
                closeDrawer();
              },
            );
          }
        ) : Container(),
    );
  }

  @override
  void dispose() {

  }


}