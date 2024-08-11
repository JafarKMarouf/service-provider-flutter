import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class CustomeFreelancerImage extends StatelessWidget {
  final double height, width;
  final String? image;

  const CustomeFreelancerImage({
    super.key,
    required this.height,
    required this.width,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(240),
        child: image != null
            ? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: image!,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const CircleAvatar(radius: 90),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: kPrimaryColor),
              )
            : Image.asset(AppImages.profile),
      ),
    );
  }
}
