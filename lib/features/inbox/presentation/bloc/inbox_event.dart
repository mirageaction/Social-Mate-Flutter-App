part of 'inbox_bloc.dart';

sealed class InboxEvent extends Equatable {
  const InboxEvent();

  @override
  List<Object> get props => [];
}

class StreamChatRoomsStarted extends InboxEvent {}

class ChatRoomsUpdated extends InboxEvent {
  final List<ChatRoom> chatRooms;

  const ChatRoomsUpdated(this.chatRooms);

  @override
  List<Object> get props => [chatRooms];
}

class DeleteChatRoomRequested extends InboxEvent {
  final String roomId;

  const DeleteChatRoomRequested(this.roomId);

  @override
  List<Object> get props => [roomId];
}

class ChatRoomsErrorOccurred extends InboxEvent {
  final String message;

  const ChatRoomsErrorOccurred(this.message);

  @override
  List<Object> get props => [message];
}
