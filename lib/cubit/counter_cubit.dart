import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state < 10) {
      emit(state + 1);
      if (state + 1 == 10) {}
    } else {}
  }

  void decrement() {
    if (state > -10) {
      emit(state - 1);
      if (state - 1 == -10) {}
    } else {}
  }

  void reset() => emit(0);
}
