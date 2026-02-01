
class SignUpEntity {
  final String emailOrPhone;
  final String password;
  final String confirmPassword;
  final String name;

  const SignUpEntity({
    required this.emailOrPhone,
    required this.password,
    required this.confirmPassword,
    required this.name,
  });

}
