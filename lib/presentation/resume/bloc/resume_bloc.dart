

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/service/resume_service.dart';
import 'package:portfolio_builder_ai/widgets/toast.dart';

import '../../../network/models/resume.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc() : super(ResumeInitial()) {
    on<ParseResume>(_onParseResume);
  }

  final _service = ResumeService();

  _onParseResume(ParseResume event, Emitter emit)async{
    emit(Uploading());
    try{

      var fileUrl = await _uploadFile(event.file);
      toast('File uploaded');
      emit(Parsing());
      var parsedResume = await _service.parseResumeData(fileUrl);
      // toast('File parsed');
      emit(Building());
      // var data = await _aiService.getResumeSchema(parsedResume);
      var resumeData = await _service.createResume(
        name: 'My Resume',
        link: fileUrl,
        parsed: parsedResume
      );
      print(resumeData);
      var resume = Resume.fromMap(resumeData);
      emit(ResumeParsed(resume));
    }catch(error){
      emit(Failure());
    }
  }

  _uploadFile(PlatformFile file)async{

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('resumes')
        .child('resume.pdf');
    TaskSnapshot snapshot = await ref.putData(file.bytes!);
    return await snapshot.ref.getDownloadURL();
  }

}
