class RegisterRequestDto {
  String firstName;
  String lastName;
  String email;
  String password;

  RegisterRequestDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      };
}
