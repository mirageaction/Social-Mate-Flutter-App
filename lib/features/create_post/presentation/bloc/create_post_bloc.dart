import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/enums/post_media_type.dart';
import 'package:social_mate_app/features/create_post/domain/usecases/create_post_usecase.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

@injectable
class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostUsecase _createPostUsecase;

  CreatePostBloc(this._createPostUsecase) : super(CreatePostInitial()) {
    on<SubmitPostEvent>(_onSubmitPostEvent);
  }

  Future<void> _onSubmitPostEvent(
    SubmitPostEvent event,
    Emitter<CreatePostState> emit,
  ) async {
    emit(CreatePostLoading());
    try {
      await _createPostUsecase(
        content: event.content,
        media: event.media,
        mediaType: event.mediaType,
      );
      emit(CreatePostSuccess());
    } catch (e) {
      emit(CreatePostFailure(e.toString()));
    }
  }
}
