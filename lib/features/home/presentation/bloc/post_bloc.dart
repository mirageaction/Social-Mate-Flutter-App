import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/usecases/get_posts_usecse.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUsecse _getPostsUsecse;
  PostBloc(this._getPostsUsecse) : super(PostInitial()) {
    on<GetPostsEvent>(_onGetPosts, transformer: droppable());
  }

  Future<void> _onGetPosts(GetPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await _getPostsUsecse();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}
