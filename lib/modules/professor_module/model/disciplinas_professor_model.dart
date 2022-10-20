class DisciplinasProfessorModel {
  int? id;
  int? idProfessor;
  String? subjectName;
  int? meetNumbers;
  String? tagId;

  DisciplinasProfessorModel(
      {this.id,
      this.idProfessor,
      this.subjectName,
      this.meetNumbers,
      this.tagId});

  DisciplinasProfessorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProfessor = json['id_professor'];
    subjectName = json['subject_name'];
    meetNumbers = json['meet_numbers'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_professor'] = this.idProfessor;
    data['subject_name'] = this.subjectName;
    data['meet_numbers'] = this.meetNumbers;
    data['tag_id'] = this.tagId;
    return data;
  }
}
