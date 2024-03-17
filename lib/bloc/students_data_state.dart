import 'package:equatable/equatable.dart';

class StudentsDataState extends Equatable {
  final List StudentsData;
  final String selectedsem;
  double cgpa;
  double avg;

  StudentsDataState(
      {this.StudentsData = const [],
      this.selectedsem = 'Semester 1',
      this.cgpa = 0,
      this.avg = 0});

  StudentsDataState copyWith(
      {List? studentsData, String? selectedSem, double? Cgpa, double? Avg}) {
    return StudentsDataState(
        StudentsData: studentsData ?? [],
        selectedsem: selectedSem ?? 'sem1',
        avg: Avg ?? this.avg,
        cgpa: Cgpa ?? this.cgpa);
  }

  @override
  List<Object?> get props => [StudentsData, selectedsem];
}
