class LoginState {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool emailCorrect;
  final bool pwdCorrect;

  LoginState({
    required this.email,
    required this.password,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.emailCorrect,
    required this.pwdCorrect,
  });

  factory LoginState.initial() {
    return LoginState(
      email: '',
      password: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      emailCorrect: false,
      pwdCorrect: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
      bool? emailCorrect,
      bool? pwdCorrect
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      emailCorrect: emailCorrect ?? this.emailCorrect,
      pwdCorrect: pwdCorrect ?? this.pwdCorrect,
    );
  }
}
