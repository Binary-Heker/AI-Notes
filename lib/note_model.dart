class Note {
  String id;
  String title;
  String content;
  String summary;
  DateTime lastEdited;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.summary,
    required this.lastEdited,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      summary: json['summary'],
      lastEdited: DateTime.parse(json['lastEdited']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'summary': summary,
      'lastEdited': lastEdited.toIso8601String(),
    };
  }
}
