import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_mate_app/features/widgets/shimmer_box.dart';

class ShimmerImage extends StatelessWidget {
  final double size;
  final String imageUrl;
  const ShimmerImage({super.key, required this.size, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CachedNetworkImage(
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
