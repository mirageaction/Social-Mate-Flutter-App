import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';
import 'package:social_mate_app/core/services/media_cache_service.dart';
import 'package:social_mate_app/global/widgets/svg_icon.dart';

class ShimmerAvater extends StatelessWidget {
  final double size;
  final String imageUrl;
  final Color? errorColor;
  final VoidCallback? onTap;
  final double? padding;
  final bool showBorder;
  const ShimmerAvater({
    super.key,
    required this.size,
    required this.imageUrl,
    this.errorColor,
    this.onTap,
    this.padding,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        child: CachedNetworkImage(
          cacheManager: MediaCacheService.imageCache,
          imageUrl: imageUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          placeholder: (context, url) =>
              ShimmerBox(height: size, width: size, borderRadius: 100),
          errorWidget: (context, url, error) => Container(
            padding: EdgeInsets.all(padding ?? size * 0.2),
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withValues(alpha: 0.3),
            ),
            child: SvgIcon(
              path: Assets.icons.person.path,
              size: size,
              color: errorColor ?? Colors.grey.withValues(alpha: 0.8),
            ),
          ),
        ),
      ),
    );
  }
}
