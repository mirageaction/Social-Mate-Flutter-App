import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/inbox/domain/entities/chat_room.dart';
import 'package:social_mate_app/features/inbox/domain/usecases/delete_chat_room_usecase.dart';
import 'package:social_mate_app/features/inbox/domain/usecases/stream_chat_rooms_usecase.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

@injectable
class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final StreamChatRoomsUsecase _streamChatRoomsUsecase;
  final DeleteChatRoomUsecase _deleteChatRoomUsecase;
  StreamSubscription? _chatRoomsSubscription;

  InboxBloc(this._streamChatRoomsUsecase, this._deleteChatRoomUsecase)
    : super(InboxLoading()) {
    on<StreamChatRoomsStarted>(_onStreamChatRoomsStarted);
    on<ChatRoomsUpdated>(_onChatRoomsUpdated);
    on<ChatRoomsErrorOccurred>(_onChatRoomsErrorOccurred);
    on<DeleteChatRoomRequested>(_onDeleteChatRoomRequested);

    // Auto-start streaming when bloc is created
    add(StreamChatRoomsStarted());
  }

  void _onStreamChatRoomsStarted(
    StreamChatRoomsStarted event,
    Emitter<InboxState> emit,
  ) {
    emit(InboxLoading());
    _chatRoomsSubscription?.cancel();
    _chatRoomsSubscription = _streamChatRoomsUsecase.call().listen(
      (chatRooms) {
        add(ChatRoomsUpdated(chatRooms));
      },
      onError: (error) {
        add(ChatRoomsErrorOccurred(error.toString()));
      },
    );
  }

  void _onChatRoomsUpdated(ChatRoomsUpdated event, Emitter<InboxState> emit) {
    emit(InboxLoaded(event.chatRooms));
  }

  void _onChatRoomsErrorOccurred(
    ChatRoomsErrorOccurred event,
    Emitter<InboxState> emit,
  ) {
    emit(InboxError(event.message));
  }

  Future<void> _onDeleteChatRoomRequested(
    DeleteChatRoomRequested event,
    Emitter<InboxState> emit,
  ) async {
    try {
      await _deleteChatRoomUsecase.call(event.roomId);
    } catch (e) {
      emit(InboxError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _chatRoomsSubscription?.cancel();
    return super.close();
  }
}
