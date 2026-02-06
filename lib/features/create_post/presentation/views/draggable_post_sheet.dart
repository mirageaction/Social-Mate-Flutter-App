import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/media_picker_bloc.dart';
import 'package:social_mate_app/global/widgets/svg_icon.dart';

void showCreatePostSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider.value(
        value: context.read<MediaPickerBloc>(),
        child: const _DraggablePostSheet(),
      );
    },
  );
}

class _DraggablePostSheet extends StatefulWidget {
  const _DraggablePostSheet();

  @override
  State<_DraggablePostSheet> createState() => _DraggablePostSheetState();
}

class _DraggablePostSheetState extends State<_DraggablePostSheet> {
  @override
  Widget build(BuildContext context) {
    final icons = Assets.icons;
    final strings = AppStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.25,
      maxChildSize: 0.65,
      snap: true,
      snapSizes: const [0.35, 0.6, 0.65],
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
          child: Container(
            color: colorScheme.surface,
            child: Column(
              children: [
                _dragHandle(),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      _PostOption(
                        icon: icons.imageOutline.path,
                        title: strings.addPhoto,
                        onTap: () {
                          context.read<MediaPickerBloc>().add(
                            PickImageFromGalleryEvent(),
                          );
                          context.pop();
                        },
                      ),
                      _PostOption(
                        icon: icons.addVideo.path,
                        title: strings.addVideo,
                        onTap: () {},
                      ),
                      _PostOption(
                        icon: icons.addDocument.path,
                        title: strings.addDocument,
                        onTap: () {},
                      ),
                      _PostOption(
                        icon: icons.backgroundColor.path,
                        title: strings.backgroundColor,
                        onTap: () {},
                      ),
                      _PostOption(
                        icon: icons.gif.path,
                        title: strings.addGif,
                        onTap: () {},
                      ),
                      _PostOption(
                        icon: icons.liveVideo.path,
                        title: strings.liveVideo,
                        onTap: () {},
                      ),
                      _PostOption(
                        icon: icons.cameraOutline.path,
                        title: strings.camera,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dragHandle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 45.w,
        height: 5.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}

class _PostOption extends StatelessWidget {
  const _PostOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: SvgIcon(path: icon, size: 24.w, color: colorScheme.primary),
      title: Text(
        title,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
