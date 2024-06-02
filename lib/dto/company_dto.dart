class CompanyDTO {
  final String id;
  final String name;
  final String address;
  final String email;
  final int capacity;
  final String color;
  final String phone;

  CompanyDTO({
    required this.email,
    required this.capacity,
    required this.id,
    required this.name,
    required this.address,
    required this.color,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'email': email,
      'capacity': capacity,
      'color': color,
      'phone': phone,
    };
  }

  factory CompanyDTO.fromMap(Map<String, dynamic> map) {
    return CompanyDTO(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      capacity: map['capacity'],
      color: map['color'],
      phone: map['phone'],
    );
  }
}
