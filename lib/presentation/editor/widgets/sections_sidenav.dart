import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/presentation/editor/pages/template_editor/template_editor_viewmodel.dart';
import 'package:portfolio_builder_ai/presentation/editor/widgets/section_list_item.dart';

import '../../../constants/colors_const.dart';
import '../../../constants/data_const.dart';
import '../../../constants/shadow_const.dart';

class SectionsSideNav extends StatelessWidget {
  final TemplateEditorViewModel viewModel;
  const SectionsSideNav({
    super.key,
    required this.viewModel  
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.hideSideNav,
      builder: (_, val, __) {
        return Container(
          width: val ? 50 : 260,
          decoration: BoxDecoration(
            color: ColorsConst.white,
            boxShadow: ShadowConst.light(context)
          ),
          child: Column(
            children: [

              Padding(
                padding: !val ?const EdgeInsets.fromLTRB(16, 8, 4, 4) : const EdgeInsets.only(top: 8, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(!val)
                    'Sections'.bodyMedium(context),
                    IconButton(
                      onPressed: (){
                        viewModel.hideSideNav.value = !val;
                      }, 
                      splashRadius: 20,
                      icon: Icon(
                        val ? Icons.keyboard_arrow_right_rounded : Icons.keyboard_arrow_left_rounded
                    ))
                  ],
                ),
              ),

              const Divider(),

              ValueListenableBuilder(
                valueListenable: viewModel.selectedItem,
                builder: (_, selectedItem, __) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: DataConst.sections.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index){
                        var section = DataConst.sections[index];
                        return SectionListItem(
                          isSelected: selectedItem==section, 
                          section: section, 
                          onTap: (){
                            viewModel.selectedItem.value = section;
                            viewModel.openDrawer();
                          },
                          hideSideNav: val
                        );  
                      }),
                  );
                }
              )
            ],
          ),
        );
      }
    );
  }
}