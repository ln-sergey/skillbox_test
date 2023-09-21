class User {
  final String name;
  final String email;

  User._(this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'name': String name,
          'email': String email,
        }) {
      return User._(name, email);
    } else {
      throw const FormatException();
    }
  }

  get initials => name.split(' ').map((part) => part[0]).join().toUpperCase();
}
