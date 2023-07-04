import 'package:bloc/bloc.dart';


part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainExEvent>((event, emit) {
      emit(const MainState());
    });
  }
}
