import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final strings = AppStrings.of(context);

    return Scaffold(
      appBar: CreatePostAppBar(textTheme: textTheme, colorScheme: colorScheme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShimmerAvatar(size: 40.w, imageUrl: ''),
                10.horizontalSpace,
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.w,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Public',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        4.horizontalSpace,
                        Icon(
                          Icons.arrow_drop_down,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            TextField(
              maxLines: null,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                hintStyle: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openCreatePostSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

void openCreatePostSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const _AnimatedDraggablePostSheet();
    },
  );
}

class _AnimatedDraggablePostSheet extends StatefulWidget {
  const _AnimatedDraggablePostSheet({super.key});

  @override
  State<_AnimatedDraggablePostSheet> createState() =>
      _AnimatedDraggablePostSheetState();
}

class _AnimatedDraggablePostSheetState
    extends State<_AnimatedDraggablePostSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
      builder: (context, child) {
        return DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.25,
          maxChildSize: 0.65,
          snap: true,
          snapSizes: const [0.35, 0.6, 0.65],
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _dragHandle(),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          _item(Icons.image, "Add A Photo"),
                          _item(Icons.videocam, "Add A Video"),
                          _item(Icons.attach_file, "Add A Document"),
                          _item(Icons.color_lens, "Background Color"),
                          _item(Icons.gif_box, "Add Gif"),
                          _item(Icons.live_tv, "Live Video"),
                          _item(Icons.camera_alt, "Camera"),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _dragHandle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 45,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _item(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        // handle action
      },
    );
  }
}

class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreatePostAppBar({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close, color: colorScheme.onSurface, size: 24.w),
          ),
          Text('Create a Post'),
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Post', style: textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
