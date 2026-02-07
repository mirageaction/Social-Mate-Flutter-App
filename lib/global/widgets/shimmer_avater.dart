import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';
import 'package:social_mate_app/core/services/media_cache_service.dart';

class ShimmerAvatar extends StatelessWidget {
  final double size;
  final String imageUrl;
  const ShimmerAvatar({super.key, required this.size, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CachedNetworkImage(
        cacheManager: MediaCacheService.imageCache,
        imageUrl: imageUrl,
        width: size,
        height: size,
        placeholder: (context, url) =>
            ShimmerBox(height: size, width: size, borderRadius: 100),
        errorWidget: (context, url, error) =>
            ShimmerBox(height: size, width: size, borderRadius: 100),
      ),
    );
  }
}
