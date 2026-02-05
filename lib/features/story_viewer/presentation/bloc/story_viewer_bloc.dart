import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/story_viewer/domain/usecases/get_author_stories_usecase.dart';

part 'story_viewer_event.dart';
part 'story_viewer_state.dart';

@injectable
class StoryViewerBloc extends Bloc<StoryViewerEvent, StoryViewerState> {
  final GetAuthorStoriesUseCase getAuthorStoriesUseCase;

  StoryViewerBloc({required this.getAuthorStoriesUseCase})
    : super(StoryViewerInitial()) {
    on<GetAuthorStoriesEvent>(_onGetAuthorStories, transformer: droppable());
  }

  Future<void> _onGetAuthorStories(
    GetAuthorStoriesEvent event,
    Emitter<StoryViewerState> emit,
  ) async {
    emit(StoryViewerLoading(event.authorId));
    try {
      final stories = await getAuthorStoriesUseCase(event.authorId);
      emit(StoryViewerLoaded(stories: stories));
    } catch (e) {
      emit(StoryViewerError(message: e.toString()));
    }
  }
}
