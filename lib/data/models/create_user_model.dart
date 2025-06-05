class CreateUserModel {
  final String firstName, email, lastname, phoneNumber, password;

  CreateUserModel({
    required this.firstName,
    required this.email,
    required this.lastname,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastname,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}
