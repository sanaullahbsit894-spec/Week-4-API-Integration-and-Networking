class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String company;
  final String city;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    phone: json['phone'],
    website: json['website'],
    company: json['company']['name'],
    city: json['address']['city'],
  );

  String get avatarUrl =>
      'https://api.dicebear.com/7.x/initials/png?seed=$name&backgroundColor=4B5694&textColor=EAE0CF&size=128';
}
