import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/constants/shadow_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/network/models/basic.dart';
import 'package:portfolio_builder_ai/network/models/location.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';
import 'package:portfolio_builder_ai/presentation/editor/pages/template_editor/template_editor_viewmodel.dart';
import 'package:portfolio_builder_ai/presentation/editor/widgets/launch_button.dart';
import 'package:portfolio_builder_ai/presentation/editor/widgets/sections_sidenav.dart';
import 'package:portfolio_builder_ai/presentation/editor/widgets/viewport_changer.dart';
import 'package:portfolio_builder_ai/presentation/templates/pages/template_view.dart';

class TemplateEditorView extends StatefulWidget {
  const TemplateEditorView({super.key});

  @override
  State<TemplateEditorView> createState() => _TemplateEditorViewState();
}

class _TemplateEditorViewState extends State<TemplateEditorView> {
  late TemplateEditorViewModel _viewModel;

  @override
  void initState() {
    _viewModel = TemplateEditorViewModel(context, schema: const ResumeSchema(basic: Basic(), location: Location()))..initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _viewModel.resume,
      builder: (_, resume, __) {

        return Scaffold(
          key: _viewModel.scaffoldKey,
          endDrawer: ValueListenableBuilder(
            valueListenable: _viewModel.selectedItem,
            builder: (_, selectedItem, __) {
              return _viewModel.getDrawerWidget(selectedItem!.toLowerCase());
            }
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const ViewPortChanger(
              
            ),
            actions: [
              IconButton(
                onPressed: (){}, 
                splashRadius: 20,
                icon: const Icon(Icons.settings, size: 20, color: ColorsConst.grey1,)
              ),
              8.width(),
              IconButton(
                onPressed: (){}, 
                splashRadius: 20,
                icon: const Icon(Icons.open_in_new, size: 20, color: ColorsConst.grey1,)
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 20),
                child: LaunchButton()),
            ],
          ),
          body: Row(
            children: [
              SectionsSideNav(
                viewModel: _viewModel
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: BoxDecoration(
                    boxShadow: ShadowConst.normal(context),
                  ),
                  child: TemplateView(schema: ResumeSchema(
                    basic: _viewModel.basic.value,
                    location: const Location()
                  )),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}