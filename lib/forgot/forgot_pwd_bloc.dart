import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_pwd_event.dart';
part 'forgot_pwd_state.dart';

class ForgotPwdBloc extends Bloc<ForgotPwdEvent, ForgotPwdState> {
  ForgotPwdBloc() : super(ForgotPwdInitial()) {
    on<ForgotPwdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
