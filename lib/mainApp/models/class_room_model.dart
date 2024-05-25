class ClassRoomList {
  final List<ClassRoomModel> classRooms;

  ClassRoomList({required this.classRooms});

  factory ClassRoomList.fromJson(List<dynamic> jsonList) {
    return ClassRoomList(
      classRooms: jsonList.map((json) => ClassRoomModel.fromJson(json as Map<String, dynamic>)).toList(),
    );
  }
}

class ClassRoomModel {
  final int id;
  final int size;
  final String name;
  final String layout;

  ClassRoomModel({
    required this.id,
    required this.name,
    required this.size,
    required this.layout,
  });

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      id: json['id'] as int,
      size: json['size'] as int,
      name: json['name'] as String,
      layout: json['layout'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'size': size,
      'layout': layout,
    };
  }
}
