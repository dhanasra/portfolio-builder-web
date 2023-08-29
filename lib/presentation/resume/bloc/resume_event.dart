part of 'resume_bloc.dart';

@immutable
class ResumeEvent {}

class ParseResume extends ResumeEvent {
  final PlatformFile file;

  ParseResume(this.file);
}