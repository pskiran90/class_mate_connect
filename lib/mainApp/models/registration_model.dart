class RegistrationList {
  final List<RegistrationModel> registrationList;

  RegistrationList({required this.registrationList});

  factory RegistrationList.fromJson(List<dynamic> jsonList) {
    return RegistrationList(
      registrationList: jsonList.map((json) => RegistrationModel.fromMap(json as Map<String, dynamic>)).toList(),
    );
  }
}

class RegistrationModel {
  final int id;
  final int student;
  final int subject;

  RegistrationModel({
    required this.id,
    required this.student,
    required this.subject,
  });

  factory RegistrationModel.fromMap(Map<String, dynamic> json) {
    return RegistrationModel(
      id: json['id'] ?? 0,
      student: json['student'] ?? 0,
      subject: json['subject'] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student': student,
      'subject': subject,
    };
  }
}
