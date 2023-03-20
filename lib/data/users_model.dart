class UserModel {
  String name;
  String email;
  String address;
  String skillOne;
  String skillTwo;

  UserModel(
      {required this.name,
      required this.email,
      required this.address,
      required this.skillOne,
      required this.skillTwo});

  factory UserModel.empty() =>
      UserModel(name: '', email: '', address: '', skillOne: '', skillTwo: '');
}
