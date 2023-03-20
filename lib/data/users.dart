class User {
  String name;
  String email;
  String address;
  List<String> skills;

  User({required this.name, required this.email, required this.address, required this.skills});

  factory User.empty() => User(name: '', email: '', address: '', skills: []);
}
