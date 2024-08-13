import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_datum.dart';

class CategoryInfosMinimum extends StatelessWidget {
  final CategoryDatum data;
  const CategoryInfosMinimum({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor,
              ),
              child: CachedNetworkImage(
                imageUrl: '${data.photo}',
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 45,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.title!,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins SemiBold',
              color: Color(0xff252525),
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
