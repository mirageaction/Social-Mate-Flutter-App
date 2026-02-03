import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/create_story/presentation/bloc/gallery_bloc.dart';
import 'package:social_mate_app/features/create_story/presentation/views/photo_item.dart';
import 'package:social_mate_app/features/create_story/presentation/views/shimmer_photos.dart';

class PhotosGrid extends StatelessWidget {
  const PhotosGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryBloc, GalleryState>(
      listenWhen: (previous, current) => current is GalleryError,
      listener: (context, state) {
        if (state is GalleryError) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is GalleryLoaded ||
          current is GalleryError ||
          current is GalleryLoading,
      builder: (context, state) {
        if (state is GalleryLoading) {
          return const ShimmerPhotos();
        }
        if (state is GalleryError) {
          return const SizedBox.shrink();
        }
        if (state is GalleryLoaded) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 170.h,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return PhotoItem(photo: state.photos[index]);
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}