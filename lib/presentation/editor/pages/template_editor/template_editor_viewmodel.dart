import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';
import 'package:portfolio_builder_ai/network/models/basic.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';
import 'package:portfolio_builder_ai/presentation/forms/basics_form.dart';
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
        ) : Container(),
    );
  }

  @override
  void dispose() {

  }


}