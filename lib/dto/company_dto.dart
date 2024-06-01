class CompanyDTO {
  final String id;
  final String name;
  final String address;
  final String email;
  final int capacity;

  CompanyDTO({
    required this.email,
    required this.capacity,
    required this.id,
    required this.name,
    required this.address,
  });
}
