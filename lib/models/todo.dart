class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo._(this.id, this.title,  this.completed);

  factory Todo.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'id': int id,
          'title': String title,
          'completed': bool completed,
        }) {
      return Todo._(id, title, completed);
    } else {
      throw const FormatException();
    }
  }
}
