import 'package:bloc/bloc.dart';
import 'package:brainboost/bloc/students_data_state.dart';
import 'package:meta/meta.dart';

part 'students_data_event.dart';

class StudentsDataBloc extends Bloc<StudentsDataEvent, StudentsDataState> {
  StudentsDataBloc() : super(StudentsDataState()) {
    on<getnewlist>(getlist);
  }

  void getlist(getnewlist event, Emitter<StudentsDataState> emit) {
    emit(state.copyWith(
        studentsData: event.studentsmarks,
        selectedSem: event.selectedsem,
        Avg: event.avg,
        Cgpa: event.cgpa));
  }
}
