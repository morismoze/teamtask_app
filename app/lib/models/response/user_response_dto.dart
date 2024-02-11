class UserResponseDto {
  String uid;
  String email;
  String firstName;
  String lastName;
  String role;
  String status;
  DateTime createdAt;

  UserResponseDto({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.status,
    required this.createdAt,
  });

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      UserResponseDto(
        uid: json["uid"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        role: json["role"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
      );
}
