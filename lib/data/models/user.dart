class User {
  String id;
  String name;
  String email;
  String phone;
  String address;

  User({required this.id, required this.name, required this.email, required this.phone, required this.address});
  factory User.formJson(Map<String, dynamic> json) => User(id: "${json["id"]}", name: "${json["Name"]}", email: "${json["Email"]}", phone: "${json["Phone"]}", address: "${json["Address"]}");
}