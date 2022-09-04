class UserData {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final List<String> favorites;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.favorites,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'favorites': favorites};
  }

  factory UserData.fromMap(Map<String, dynamic> map, String id) {
    return UserData(
      id: id,
      name: map['name'],
      email: map['email'],
      avatar: map['avatar'],
      favorites: List.from(map['favorites']),
    );
  }

  factory UserData.initial() {
    return UserData(id: '', name: '', email: '', avatar: '', favorites: []);
  }
}
