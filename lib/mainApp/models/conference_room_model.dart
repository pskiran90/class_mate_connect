class ConferenceRoomModel {
  final int id;
  final int size;
  final String name;
  final String layout;
  final int subject;

  ConferenceRoomModel({
    required this.id,
    required this.name,
    required this.size,
    required this.layout,
    required this.subject,
  });

  factory ConferenceRoomModel.fromJson(Map<String, dynamic> json) {
    return ConferenceRoomModel(
      id: json['id'] as int,
      size: json['size'] as int,
      name: json['name'] as String,
      layout: json['layout'] as String,
      subject: json['subject'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'size': size,
      'layout': layout,
      'subject': subject,
    };
  }
}
