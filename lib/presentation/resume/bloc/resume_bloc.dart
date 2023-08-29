import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/network/service/resume_service.dart';
import 'package:portfolio_builder_ai/widgets/toast.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc() : super(ResumeInitial()) {
    on<ParseResume>(_onParseResume);
  }

  final _service = ResumeService();

  _onParseResume(ParseResume event, Emitter emit)async{
    showLoader();
    try{

      var parsedResume = await _service.parseResumeData('https://firebasestorage.googleapis.com/v0/b/portfolio-builder-57d7d.appspot.com/o/DHANA%20SEKARAN.pdf?alt=media&token=8cbafb97-8940-4e7b-9c15-8eca2d44a935');
      var data = await _service.getResumeSchema(parsedResume);
      hideLoader();
    }catch(error){
      hideLoader();
      print(error);
    }

  }
}
