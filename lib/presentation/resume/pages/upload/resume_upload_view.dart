import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/assets_const.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/constants/shadow_const.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/presentation/resume/pages/upload/resume_upload_viewmodel.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';

class ResumeUploadView extends StatefulWidget {
  const ResumeUploadView({super.key});

  @override
  State<ResumeUploadView> createState() => _ResumeUploadViewState();
}

class _ResumeUploadViewState extends State<ResumeUploadView> {
  late ResumeUploadViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ResumeUploadViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsConst.background,
        alignment: Alignment.center,
        child: Container( 
          constraints: const BoxConstraints(
            minWidth: 600,
            maxHeight: 500
          ),
          decoration: BoxDecoration(
            color: ColorsConst.white,
            boxShadow: ShadowConst.light(context),
            borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetsConst.uploadResume, width: 300,),

              'DOC, DOCX, PDF (2MB)'.labelLarge(context),
              
              SizedBox(
                width: 400,
                child: EButton(
                  onClick: ()=>_viewModel.pickFile(), 
                  text: 'UPLOAD RESUME'
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}