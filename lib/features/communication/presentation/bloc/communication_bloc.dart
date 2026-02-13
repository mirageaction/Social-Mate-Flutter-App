import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'communication_event.dart';
part 'communication_state.dart';

class CommunicationBloc extends Bloc<CommunicationEvent, CommunicationState> {
  CommunicationBloc() : super(CommunicationInitial()) {
    on<CommunicationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
