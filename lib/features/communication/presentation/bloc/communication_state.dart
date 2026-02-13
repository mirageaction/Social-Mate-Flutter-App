part of 'communication_bloc.dart';

sealed class CommunicationState extends Equatable {
  const CommunicationState();
  
  @override
  List<Object> get props => [];
}

final class CommunicationInitial extends CommunicationState {}
