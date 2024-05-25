class StudentsList {
  final List<StudentModel> studentsList;

  StudentsList({required this.studentsList});

  // Factory constructor to create a StudentSummaryList object from a JSON list
  factory StudentsList.fromJson(List<dynamic> jsonList) {
    return StudentsList(
      studentsList: jsonList.map((json) => StudentModel.fromJson(json as Map<String, dynamic>)).toList(),
    );
  }
}

class StudentModel {
  final int id;
  final String name;
  final int age;
  final String email;

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  // Factory constructor to create a StudentModel object from JSON
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
    );
  }

  // Method to convert a StudentModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
    };
  }
}
