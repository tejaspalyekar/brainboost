part of 'students_data_bloc.dart';

@immutable
abstract class StudentsDataEvent {
  StudentsDataEvent();
  List<Object> get props => [];
}

class getnewlist extends StudentsDataEvent {
  List studentsmarks;
  String selectedsem;
  double cgpa;
  int? rank;
  double avg;
  getnewlist(
      {required this.studentsmarks,
      required this.selectedsem,
      this.rank,
      required this.cgpa,
      required this.avg});
}
