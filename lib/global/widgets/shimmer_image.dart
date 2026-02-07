import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';
import 'package:social_mate_app/core/services/media_cache_service.dart';

class ShimmerImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final double borderRadius;
  final BoxFit fit;
  final Alignment alignment;

  const ShimmerImage({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.borderRadius,
    this.alignment = Alignment.center,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        cacheManager: MediaCacheService.imageCache,
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        placeholder: (context, url) => ShimmerBox(
          height: height,
          width: width,
          borderRadius: borderRadius,
        ),
        errorWidget: (context, url, error) => ShimmerBox(
          height: height,
          width: width,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
