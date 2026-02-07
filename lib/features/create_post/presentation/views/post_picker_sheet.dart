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
    constraints: BoxConstraints(maxHeight: 400.h),
    builder: (_) {
      return BlocProvider.value(
        value: context.read<MediaPickerBloc>(),
        child: const _PostPickerSheet(),
      );
    },
  );
}

class _PostPickerSheet extends StatefulWidget {
  const _PostPickerSheet();

  @override
  State<_PostPickerSheet> createState() => _PostPickerSheetState();
}

class _PostPickerSheetState extends State<_PostPickerSheet> {
  @override
  Widget build(BuildContext context) {
    final icons = Assets.icons;
    final strings = AppStrings.of(context);

    return Column(
      children: [
        _PostOption(
          icon: icons.imageOutline.path,
          title: strings.addPhoto,
          onTap: () {
            context.read<MediaPickerBloc>().add(PickImageFromGalleryEvent(type: MediaPickerType.image));
            context.pop();
          },
        ),
        _PostOption(
          icon: icons.addVideo.path,
          title: strings.addVideo,
          onTap: () {
            context.read<MediaPickerBloc>().add(PickVideoFromGalleryEvent(type: MediaPickerType.video));
            context.pop();
          },
        ),
        _PostOption(
          icon: icons.addDocument.path,
          title: strings.addDocument,
          onTap: () {
            context.read<MediaPickerBloc>().add(PickDocumentEvent(type: MediaPickerType.file));
            context.pop();
          },
        ),
        _PostOption(icon: icons.gif.path, title: strings.addGif, onTap: () {}),
        _PostOption(
          icon: icons.cameraOutline.path,
          title: strings.camera,
          onTap: () {
            context.read<MediaPickerBloc>().add(PickImageFromCameraEvent(type: MediaPickerType.image));
            context.pop();
          },
        ),
      ],
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
