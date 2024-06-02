class UserDto {
  final String avatar;
  final String name;
  final String id;
  final String companyId;

  UserDto({
    required this.avatar,
    required this.name,
    required this.id,
    required this.companyId,
  });
  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'name': name,
      'id': id,
      'companyId': companyId,
    };
  }

  static UserDto fromMap(Map<String, dynamic> map) {
    return UserDto(
      avatar: map['avatar'],
      name: map['name'],
      id: map['id'],
      companyId: map['companyId'],
    );
  }
}
