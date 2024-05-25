class SubjectsList {
  final List<SubjectsModel> subjects;

  SubjectsList({required this.subjects});

  factory SubjectsList.fromJson(List<dynamic> jsonList) {
    return SubjectsList(
      subjects: jsonList.map((json) => SubjectsModel.fromJson(json as Map<String, dynamic>)).toList(),
    );
  }
}

class SubjectsModel {
  final int id;
  final int credits;
  final String name;
  final String teacher;

  SubjectsModel({
    required this.id,
    required this.name,
    required this.credits,
    required this.teacher,
  });

  factory SubjectsModel.fromJson(Map<String, dynamic> json) {
    return SubjectsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      credits: json['credits'] as int,
      teacher: json['teacher'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'credits': credits,
      'teacher': teacher,
    };
  }
}
