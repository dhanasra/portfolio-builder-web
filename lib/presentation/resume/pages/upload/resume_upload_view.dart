import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/presentation/resume/pages/upload/resume_upload_viewmodel.dart';
import 'package:portfolio_builder_ai/widgets/bs_container.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/o_button.dart';

import '../../../../constants/assets_const.dart';
import '../../../../widgets/splash_logo.dart';
import '../../bloc/resume_bloc.dart';

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
    return BlocListener<ResumeBloc, ResumeState>(
      listener: (context, state) {},
      child: Scaffold(
          appBar: AppBar(
            title: const SplashLogo(),
          ),
          body: Container(
              color: ColorsConst.background,
              alignment: Alignment.center,
              child: BlocBuilder<ResumeBloc, ResumeState>(
                builder: (context, state) {
                  return BSContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 80),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          'Upload Your Resume'.headlineSmall(context),
                          8.height(),
                          SizedBox(
                              width: 100,
                              child: Divider(
                                thickness: 4,
                                color: Theme.of(context).primaryColor,
                              )),
                          30.height(),
                          'You can upload or paste your resume to get started. This process will take 30 to 45 seconds maximum.'
                              .bodySmall(context, height: 1.6, isCenter: true),
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Image.asset(
                                state is Uploading
                                  ? AssetsConst.uploading
                                  : state is Parsing || state is Building ? AssetsConst.parsing
                                  : AssetsConst.uploadResume,
                                width: 180,
                              ),
                            ),
                          ),
                          'DOC, DOCX, PDF (2MB)'.bodySmall(context),
                          30.height(),
                          if(state is! Uploading && state is! Parsing && state is! Building)
                          Row(
                            children: [
                              Expanded(
                                child: EButton(
                                    onClick: () => _viewModel.pickFile(),
                                    text: 'Upload'),
                              ),
                              30.width(),
                              Expanded(
                                child: OButton(
                                    onClick: () {}, text: 'Paste Resume'),
                              )
                            ],
                          )
                          else
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const LinearProgressIndicator(
                              minHeight: 6,
                              valueColor: AlwaysStoppedAnimation(ColorsConst.primary),
                              backgroundColor: ColorsConst.grey,
                            ),
                          )
                        ],
                      ));
                },
              ))),
    );
  }
}
