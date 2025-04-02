import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));
      await Future.delayed(Duration(seconds: 2)); // Simulate API call

      if (state.email == "test@example.com" && state.password == "password") {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      }
     else if (state.email == "test@example.com" && state.password != "password") {
        emit(state.copyWith(isSubmitting: false, pwdCorrect: true));
      }
     else if (state.email != "test@example.com" && state.password == "password") {
        emit(state.copyWith(isSubmitting: false, emailCorrect: true));
      }
      else if (state.email.isEmpty && state.password.isEmpty) {
        emit(state.copyWith(isSubmitting: false, emailCorrect: true));
      }
     else {
        emit(state.copyWith(isSubmitting: false, isFailure: true));
      }
    });
  }
}
