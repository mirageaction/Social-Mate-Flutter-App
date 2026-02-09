import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/home/presentation/bloc/post_bloc.dart';
import 'package:social_mate_app/features/home/presentation/views/post_card.dart';
import 'package:social_mate_app/features/home/presentation/views/shimmer_posts.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listenWhen: (previous, current) => current is PostError,
      listener: (context, state) {
        if (state is PostError) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        if (state is PostLoading) {
          return const ShimmerPosts();
        }
        if (state is PostError) {
          return const SizedBox.shrink();
        }
        if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return PostCard(
                post: state.posts[index],
                key: ValueKey(state.posts[index].id),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
