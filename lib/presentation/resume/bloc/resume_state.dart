part of 'resume_bloc.dart';

@immutable
class ResumeState {}

class ResumeInitial extends ResumeState {}

class ResumeParsed extends ResumeState {
  final ResumeSchema schema;

  ResumeParsed(this.schema);
}

class Failure extends ResumeState {}