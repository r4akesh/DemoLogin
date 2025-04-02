import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottombar_event.dart';
part 'bottombar_state.dart';

class BottombarBloc extends Bloc<BottombarEvent, BottombarState> {
  BottombarBloc() : super(BottombarState(0)) {
    on<TabSelected>((event, emit) {
      emit(BottombarState(event.index));
    });
  }
}
