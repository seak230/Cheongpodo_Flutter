class AuthRequest {
  final String id;
  final String password;

  AuthRequest({required this.id, required this.password});

  Map<String, dynamic> toJson() => {
    'id': id,
    'password': password,
  };
}
