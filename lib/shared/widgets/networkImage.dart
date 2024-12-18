import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget(
      {super.key, required this.imageUrl, this.width, this.height});
  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? 100,
      height: height ?? 100,
      fit: BoxFit.contain,
      progressIndicatorBuilder: (context, imageUrl, progress) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        );
      },
      errorWidget: (context, imageUrl, object) {
        return Image.asset(
          "logo".png(),
          height: 100,
          width: 100,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
