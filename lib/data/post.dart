class ticket {
  final int userId;
  final int id;
  final String title;
  final String body;

  ticket({this.userId, this.id, this.title, this.body});

  factory ticket.fromJson(Map<String, dynamic> json) {
    return ticket(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}