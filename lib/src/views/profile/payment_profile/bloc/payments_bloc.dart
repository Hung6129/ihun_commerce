import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payments_event.dart';
part 'payments_state.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  PaymentsBloc() : super(PaymentsInitial()) {
    on<PaymentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
