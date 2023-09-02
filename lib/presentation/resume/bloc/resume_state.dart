part of 'resume_bloc.dart';

@immutable
class ResumeState {}

class ResumeInitial extends ResumeState {}

class Uploading extends ResumeState {}

class Parsing extends ResumeState {}

class Building extends ResumeState {}

class ResumeParsed extends ResumeState {
  final ResumeSchema schema;

  ResumeParsed(this.schema);
}

class Failure extends ResumeState {}
