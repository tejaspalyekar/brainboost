class SemMarksModel {
  SemMarksModel(
      {required this.allStudentMarksList,
      required this.currentstudentcgpa,
      required this.semavg});
  double currentstudentcgpa;
  List allStudentMarksList = [];
  double semavg;

  factory SemMarksModel.fromjson(Map currSemData, String email) {
    return SemMarksModel(
        allStudentMarksList: currSemData["all_students_marks"],
        semavg: currSemData["average_cgpa"],
        currentstudentcgpa: currSemData[email]);
  }
}
