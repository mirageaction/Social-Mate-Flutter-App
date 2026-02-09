import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/usecases/get_author_posts_usecase.dart';
import 'package:social_mate_app/features/home/domain/usecases/get_posts_usecse.dart';
import 'package:social_mate_app/features/home/domain/usecases/toggle_dislike_usecase.dart';
import 'package:social_mate_app/features/home/domain/usecases/toggle_like_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUsecse _getPostsUsecse;
  final ToggleLikeUsecase _toggleLikeUsecase;
  final ToggleDislikeUsecase _toggleDislikeUsecase;
  final GetAuthorPostsUseCase _getAuthorPostsUseCase;

  PostBloc(
    this._getPostsUsecse,
    this._toggleLikeUsecase,
    this._toggleDislikeUsecase,
    this._getAuthorPostsUseCase,
  ) : super(PostInitial()) {
    on<GetPostsEvent>(_onGetPosts, transformer: droppable());
    on<ToggleLikeEvent>(_onToggleLike);
    on<ToggleDislikeEvent>(_onToggleDislike);
    on<GetAuthorPostsEvent>(_onGetAuthorPosts, transformer: droppable());
  }

  Future<void> _onGetAuthorPosts(GetAuthorPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await _getAuthorPostsUseCase();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
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

  Future<void> _onToggleLike(
    ToggleLikeEvent event,
    Emitter<PostState> emit,
  ) async {
    final currentState = state;
    if (currentState is PostLoaded) {
      final updatedPosts = currentState.posts.map((post) {
        if (post.id == event.postId) {
          final isLiked = !post.isLiked; 
          if (isLiked && post.isDisliked) {
            // If liking and it was disliked, remove dislike
            return post.copyWith(
              isLiked: true,
              likesCount: post.likesCount + 1,
              isDisliked: false,
              dislikesCount: post.dislikesCount > 0
                  ? post.dislikesCount - 1
                  : 0,
            );
          }
          return post.copyWith(
            isLiked: isLiked,
            likesCount: isLiked
                ? post.likesCount + 1
                : (post.likesCount > 0 ? post.likesCount - 1 : 0),
          );
        }
        return post;
      }).toList();

      emit(PostLoaded(posts: updatedPosts));

      try {
        final targetPost = currentState.posts.firstWhere(
          (p) => p.id == event.postId,
        );
        await _toggleLikeUsecase(targetPost);
      } catch (e) {
        // Rollback on error
        emit(PostLoaded(posts: currentState.posts));
      }
    }
  }

  Future<void> _onToggleDislike(
    ToggleDislikeEvent event,
    Emitter<PostState> emit,
  ) async {
    final currentState = state;
    if (currentState is PostLoaded) {
      final updatedPosts = currentState.posts.map((post) {
        if (post.id == event.postId) {
          final isDisliked = !post.isDisliked;
          if (isDisliked && post.isLiked) {
            // If disliking and it was liked, remove like
            return post.copyWith(
              isDisliked: true,
              dislikesCount: post.dislikesCount + 1,
              isLiked: false,
              likesCount: post.likesCount > 0 ? post.likesCount - 1 : 0,
            );
          }
          return post.copyWith(
            isDisliked: isDisliked,
            dislikesCount: isDisliked
                ? post.dislikesCount + 1
                : (post.dislikesCount > 0 ? post.dislikesCount - 1 : 0),
          );
        }
        return post;
      }).toList();

      emit(PostLoaded(posts: updatedPosts));

      try {
        final targetPost = currentState.posts.firstWhere(
          (p) => p.id == event.postId,
        );
        await _toggleDislikeUsecase(targetPost);
      } catch (e) {
        // Rollback on error
        emit(PostLoaded(posts: currentState.posts));
      }
    }
  }
}
