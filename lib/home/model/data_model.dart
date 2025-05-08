class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String city;
  final String companyName;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.companyName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      city: json['address']['city'],
      companyName: json['company']['name'],
    );
  }
}
