part of 'inbox_bloc.dart';

sealed class InboxState extends Equatable {
  const InboxState();

  @override
  List<Object> get props => [];
}

final class InboxLoading extends InboxState {}

final class InboxLoaded extends InboxState {
  final List<ChatRoom> chatRooms;

  const InboxLoaded(this.chatRooms);

  @override
  List<Object> get props => [chatRooms];
}

final class InboxError extends InboxState {
  final String message;

  const InboxError(this.message);

  @override
  List<Object> get props => [message];
}
