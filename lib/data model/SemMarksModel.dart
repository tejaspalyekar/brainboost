class SemMarksModel {
  SemMarksModel({required this.allStudentMarksList, required this.percentage});
  double percentage;
  List allStudentMarksList = [];

  factory SemMarksModel.fromjson(Map currSemData, String email) {
    return SemMarksModel(
        allStudentMarksList: currSemData["all_students_marks"],
        percentage: currSemData[email]);
  }
}
