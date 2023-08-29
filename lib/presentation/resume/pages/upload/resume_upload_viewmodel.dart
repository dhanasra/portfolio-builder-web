
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';
import 'package:portfolio_builder_ai/presentation/resume/bloc/resume_bloc.dart';
import 'package:portfolio_builder_ai/widgets/toast.dart';

class ResumeUploadViewModel extends BaseViewModel {

  final BuildContext context;
  ResumeUploadViewModel(this.context);

  @override
  void initialize() {

  }

  pickFile()async{
    var allowedExtensions = ['pdf', 'doc', 'docx'];
    await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    ).then((result){
      if (result != null) {
        PlatformFile file = result.files.first;
        if(allowedExtensions.contains(file.extension)){
          if (file.size < (2 * 1024 * 1024)) {

            context.read<ResumeBloc>().add(ParseResume());

            toast('File picked', success: true);

          }else{
            toast('File size exceeded 2MB.', success: false);
          }
        }else{
          toast('Invalid file format.', success: false);
        }
      } else {

      }
    });
  }

  @override
  void dispose() {

  }

}