import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/home/domain/usecases/get_stories_usecase.dart';

part 'story_event.dart';
part 'story_state.dart';

@injectable
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoriesUseCase getStoriesUseCase;
  StoryBloc({required this.getStoriesUseCase}) : super(StoryInitial()) {
    on<GetStoriesEvent>(_getStories, transformer: droppable());
  }

  Future<void> _getStories(GetStoriesEvent event, Emitter<StoryState> emit) async {
    emit(StoryLoading());
    try {
      final result = await getStoriesUseCase();
      emit(StoryLoaded(stories: result));
    } catch (e) {
      emit(StoryError(message: e.toString()));
    }
  }
}
