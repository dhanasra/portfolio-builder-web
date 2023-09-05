import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';

class SchemaCubit extends Cubit<ResumeSchema?> {
  SchemaCubit():super(null);

  update(ResumeSchema schema)=>emit(schema);
}