class SignUpRequestModel {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;

  const SignUpRequestModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
