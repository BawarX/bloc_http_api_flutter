class UserModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'] ?? 'First Name',
        lastName: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ??
            'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQxs9TzyaH9DS3XmlN40N9O8jqg0ejrPwGkTscAnxMTZAQbTafTarqtJcl-NJEs3kAlQWCe8943RZrrXmg');
  }
}
